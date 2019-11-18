require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "admin can create new movie" do
    sign_in users(:emina)
    
    visit root_path
    click_on "Add New Movie"

    fill_in "Title", with: "Test1"
    select movies(:superman).rating, from: 'movie_rating'
    fill_in "Total gross", with: movies(:superman).total_gross
    fill_in "Released on", with: movies(:superman).released_on
    fill_in "Description", with: movies(:superman).description
    fill_in "Image file name", with: movies(:superman).image_file_name
    check 'Action'

    click_on "Create Movie"

    assert_text "Movie successfully created!"
  end

  test "admin can't create movie, short description" do
    sign_in users(:emina)
    
    visit new_movie_path

    fill_in "Title", with: "Test2"
    select movies(:superman).rating, from: 'movie_rating'
    fill_in "Total gross", with: movies(:superman).total_gross
    fill_in "Released on", with: movies(:superman).released_on
    fill_in "Description", with: "..."
    check 'Action'
    fill_in "Image file name", with: movies(:superman).image_file_name

    click_on "Create Movie"
    
    assert_text "Description is too short (minimum is 25 characters)"
  end

  test "admin can't create movie, title taken" do
    sign_in users(:emina)
    
    visit new_movie_path

    fill_in "Title", with: movies(:superman).title
    select movies(:superman).rating, from: 'movie_rating'
    fill_in "Total gross", with: movies(:superman).total_gross
    fill_in "Released on", with: movies(:superman).released_on
    fill_in "Description", with: movies(:superman).description
    check 'Action'
    fill_in "Image file name", with: movies(:superman).image_file_name

    click_on "Create Movie"
    
    assert_text "Title has already been taken"
  end
end
