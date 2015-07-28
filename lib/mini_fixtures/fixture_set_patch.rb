module MiniFixtures
  module FixtureSetPatch
    extend ActiveSupport::Concern

    included do
      class << self
        alias_method_chain :fixture_is_cached?, :ignoring_mini_fixtures
      end
    end

    class_methods do
      def fixture_is_cached_with_ignoring_mini_fixtures?(connection, table_name)
        fixture_dirnames = MiniFixtures.mini_fixture_dirnames

        unless fixture_dirnames.find { |dir| table_name.to_s =~ /^#{dir}/ }
          fixture_is_cached_without_ignoring_mini_fixtures?(connection, table_name)
        end
      end
    end
  end
end

ActiveRecord::FixtureSet.send :include, MiniFixtures::FixtureSetPatch
