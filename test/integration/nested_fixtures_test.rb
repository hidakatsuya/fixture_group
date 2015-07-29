require_relative 'integration_helper'

class NestedFixturesTest < ActiveSupport::TestCase
  mini_fixtures 'for_case_b/subcase', :all

  test 'load fixtures properly' do
    assert_equal 1, Item.count
    assert_equal 1, Category.count

    item = Item.first
    assert_equal 'Item for CaseB-Sub', item.name
    assert_equal 'Category for CaseB-Sub', item.category.name
  end
end
