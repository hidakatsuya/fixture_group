require 'test_helper'

class CompositeFixturesTest < ActiveSupport::TestCase
  mini_fixtures 'common', :all, cache: true
  mini_fixtures 'for_case_a', :all

  test 'load fixtures properly' do
    assert_equal 1, User.count
    assert_equal 1, Item.count
    assert_equal 1, Category.count

    assert_equal 'user_a', User.first.login

    item = Item.first
    assert_equal 'Item for CaseA', item.name
    assert_equal 'Category for CaseA', item.category.name
  end
end
