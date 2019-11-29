require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  
  setup do 
    @movie = movies(:superman)
  end
  
  test "admin can't create new movie without image" do
    sign_in users(:admin)
  
    visit root_path
    click_on "Add New Movie"

    fill_in "Title", with: "..."
    select movies(:superman).rating, from: 'movie_rating'
    fill_in "Total gross", with: movies(:superman).total_gross
    fill_in "Released on", with: movies(:superman).released_on
    fill_in "Description", with: movies(:superman).description

    click_on "Create Movie"

    assert_text "Images are missing!"
  end

  test "admin creating a movie" do
    sign_in users(:admin)
  
    visit root_path
    click_on "Add New Movie"

    fill_in "Title", with: movies(:superman).total_gross
    select movies(:superman).rating, from: 'movie_rating'
    fill_in "Total gross", with: movies(:superman).total_gross
    fill_in "Released on", with: movies(:superman).released_on
    fill_in "Description", with: movies(:superman).description
    find('#movie_images').set(Rails.root + 'public/images/cruz.jpg')

    click_on "Create Movie"

    assert_text "Movie successfully created!"
  end
end
