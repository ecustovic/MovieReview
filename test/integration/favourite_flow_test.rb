require 'test_helper'

class FavouriteFlowTest < ActionDispatch::IntegrationTest
  test "user can see the list of fav movies" do 
    sign_in users(:dino)
    get favourites_url

    assert_response :success
  end
end
