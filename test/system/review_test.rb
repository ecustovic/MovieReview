require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  
  setup do 
		@movie = movies(:superman)
		@review = reviews(:one)
  end
  
  test "visitor can't review movie" do
    visit movie_path(@movie)
    
    click_on "Write Review"
    
    assert_text "You need to sign in or sign up before continuing."
  end

  test "admin can review movie, comment short" do
    sign_in users(:emina)
    
    visit movie_path(@movie)
    
    click_on "Write Review"
    fill_in "Comment", with: "..."
	  select @review.stars, from: 'review_stars'
    click_on "Post Review"

    assert_text "Comment is too short"
  end

  test "admin can review movie, stars required" do
    sign_in users(:emina)
    
    visit movie_path(@movie)
    
    click_on "Write Review"
    fill_in "Comment", with: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    click_on "Post Review"

    assert_text "Stars must be between 1 and 5"
  end
end