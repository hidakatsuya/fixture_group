module MiniFixtures
  module FixtureSetPatch
    extend ActiveSupport::Concern

    included do
      class << self
        alias_method :original_fixture_is_cached?, :fixture_is_cached?
      end
    end

    module ClassMethods
      @@mini_fixtures_dirnames = []

      def mini_fixtures_dirnames
        @@mini_fixtures_dirnames
      end

      def fixture_is_cached?(connection, table_name)
        return false if mini_fixtures_dirnames.include?(table_name)
        original_fixture_is_cached(connection, table_name)
      end
    end
  end
end

ActiveRecord::FixtureSet.send :include, MiniFixtures::FixtureSetPatch
