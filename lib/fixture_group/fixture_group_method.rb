module FixtureGroup
  module FixtureGroupMethod
    extend ActiveSupport::Concern

    class_methods do
      # @param [String, Symbol] fixture_set_dirname
      # @param [Array<String, Symbol>] fixture_set_names
      # @example See `*_test.rb` in https://github.com/hidakatsuya/fixture_group/tree/master/test/integration
      def fixture_group(fixture_set_dirname, *fixture_set_names)
        fixture_set_path = Pathname(fixture_path).join(fixture_set_dirname.to_s)

        if fixture_set_names.first == :all
          fixture_set_names = Pathname.glob("#{fixture_set_path}/**/*.yml")
          fixture_set_names.map! do |f|
            f.relative_path_from(fixture_set_path).to_path[0..-5]
          end
        else
          fixture_set_names = fixture_set_names.map(&:to_s)
        end

        paths, classes = [], {}

        fixture_set_names.each do |fixture_name|
          path = "#{fixture_set_dirname}/#{fixture_name}"

          unless self.fixture_class_names.key?(path)
            classes[path] = fixture_name.singularize.camelize.constantize
          end
          paths << path
        end

        set_fixture_class(classes)
        fixtures(paths)
        setup_fixture_group_accessors(paths, fixture_set_names)

        register_fixture_group_dirname(fixture_set_dirname.to_s)
      end

      private

      def setup_fixture_group_accessors(paths, fixture_set_names)
        current_accessor_names = paths.map { |path| path.tr('/', '_').to_sym }
        new_accessor_names = fixture_set_names.map(&:to_sym)

        alias_accessor_names = Hash[current_accessor_names.zip(new_accessor_names)]
        alias_accessor_names.each do |current_name, new_name|
          alias_method new_name, current_name
        end
      end

      def register_fixture_group_dirname(dirname)
        return if FixtureGroup.fixture_group_dirnames.include?(dirname)
        FixtureGroup.fixture_group_dirnames << dirname
      end
    end
  end

  # @private
  def self.fixture_group_dirnames
    @fixture_group_dirnames ||= []
  end
end

ActiveRecord::TestFixtures.send :include, FixtureGroup::FixtureGroupMethod
