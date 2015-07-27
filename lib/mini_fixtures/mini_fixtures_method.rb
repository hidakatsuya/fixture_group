module MiniFixtures
  module MiniFixturesMethod
    extend ActiveSupport::Concern

    module ClassMethods
      def mini_fixtures(fixture_set_dirname, *fixture_set_names)
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

        set_fixture_class classes
        fixtures paths

        register_mini_fixtures_dirname(fixture_set_dirname)
      end

      private

      def register_mini_fixtures_dirname(dirname)
        return if ActiveRecord::FixtureSet.mini_fixtures_dirnames.include?(dirname)
        ActiveRecord::FixtureSet.mini_fixtures_dirnames << dirname
      end
    end
  end
end

ActiveRecord::TestFixtures.send :include, MiniFixtures::MiniFixturesMethod
