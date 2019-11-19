require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:dino)
  end
  
  test "dino fixture is valid" do
    assert @user.valid?
  end
end
