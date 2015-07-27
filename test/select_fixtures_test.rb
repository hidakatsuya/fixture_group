require 'test_helper'

class SelectFixturesTest < ActiveSupport::TestCase
  mini_fixtures 'for_case_a', :categories, :items

  test 'load fixtures properly' do
    assert_equal 1, Item.count
    assert_equal 1, Category.count

    item = Item.first
    assert_equal 'Item for CaseA', item.name
    assert_equal 'Category for CaseA', item.category.name
  end
end
