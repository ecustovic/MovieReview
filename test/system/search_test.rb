require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  
  setup do 
    @one = searches(:one)
  end
  
  test "user can search movies by title" do
    sign_in users(:user)
  
    visit root_path
    fill_in "Search", with: @one.keywords
    click_on "Search"

    assert_text "JOKER"
  end

  test "user can do advanced search movies" do
    sign_in users(:user)
  
    visit root_path
    click_on "Advanced Search"
    fill_in "Keywords", with: @one.keywords
    fill_in "Released on", with: "04-01-2018"
    page.all('input[name="commit"]')[1].click

    assert_text "JOKER"
  end
end
