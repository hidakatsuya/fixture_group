require_relative 'integration_helper'

class AllFixturesTest < ActiveSupport::TestCase
  mini_fixtures 'for_case_a', :all

  test 'load fixtures properly' do
    assert_equal 1, Item.count
    assert_equal 1, Category.count

    assert_equal 'Item for CaseA', items(:case_a_item).name
    assert_equal 'Category for CaseA', items(:case_a_item).category.name
    assert_equal 'Category for CaseA', categories(:case_a_category).name
  end
end
