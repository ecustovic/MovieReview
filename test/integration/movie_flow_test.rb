require 'test_helper'

class MovieFlowTest < ActionDispatch::IntegrationTest
  test "can see the page for new movie" do 
    sign_in users(:emina)
    get "/movies/new"

    assert_response :success
  end

  test "can create a movie" do
    post movies_url,
      params: { movie: { title: "Test Test", rating: "PG" , total_gross: 500000, 
      description: "After the devastating events of Avengers: Infinity War, the universe is in ruins.", 
      released_on: "12/12/2019",
      duration: 120, director: "EC", image_file_name: "batman.jpg", genre_ids: 2 }}
    
    assert_response :redirect
    follow_redirect!

    page_text = response.body.squish
    
    assert_response :success
    assert_includes page_text, "<title>Movies</title>"
  end
end
