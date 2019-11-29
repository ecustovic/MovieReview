require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:admin)
  end
  
  test "admin fixture is valid" do
    assert @user.valid?
  end
end
