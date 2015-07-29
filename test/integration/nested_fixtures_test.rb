require_relative 'integration_helper'

class NestedFixturesTest < ActiveSupport::TestCase
  mini_fixtures 'for_case_b/subcase', :all

  test 'load fixtures properly' do
    assert_equal 1, Item.count
    assert_equal 1, Category.count

    assert_equal 'Item for CaseB-Sub', items(:case_b_subcase_item).name
    assert_equal 'Category for CaseB-Sub', items(:case_b_subcase_item).category.name
    assert_equal 'Category for CaseB-Sub', categories(:case_b_subcase_category).name
  end
end
