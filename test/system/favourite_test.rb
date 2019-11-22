require "application_system_test_case"

class FavouritesTest < ApplicationSystemTestCase
  test "visitor can't fav movie" do
    visit movie_path(movies(:joker))
    
    assert has_no_css? "div.faves"
  end

  test "visitor can't see fav movie" do
    visit root_path
    
    assert page.has_no_content? "Favourites"
  end
end
