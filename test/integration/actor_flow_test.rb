require 'test_helper'

class ActorFlowTest < ActionDispatch::IntegrationTest
  test "admin can see the list of fav movies" do 
    sign_in users(:admin)
    get favourites_url

    assert_response :success
  end

  test "admin can see the list of actors" do 
    sign_in users(:admin)
    get actors_url

    assert_response :success
  end

  test "user can't see the list of actors" do 
    sign_in users(:user)
    get actors_url
    follow_redirect!

    assert_equal 200, status
    assert_equal "/", path
  end
end