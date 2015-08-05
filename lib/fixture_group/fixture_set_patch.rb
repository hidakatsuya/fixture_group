module FixtureGroup
  module FixtureSetPatch
    def fixture_is_cached?(connection, table_name)
      fixture_dirnames = FixtureGroup.fixture_group_dirnames

      unless fixture_dirnames.find { |dir| table_name.to_s =~ /^#{dir}/ }
        super(connection, table_name)
      end
    end
  end
end

class << ActiveRecord::FixtureSet
  prepend FixtureGroup::FixtureSetPatch
end
