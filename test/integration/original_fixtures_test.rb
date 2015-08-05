require_relative 'integration_helper'

class OriginalFixturesTest < ActiveSupport::TestCase
  fixtures :users

  test 'load fixtures properly' do
    assert_equal 1, User.count
    assert_equal 'user_x', users(:user_x).login
  end
end
