require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  setup do
    @movie = movies(:batman)
  end
  
  test "batman fixture is valid" do
    assert @movie.valid?
  end

  test "#released, returns latest realeased movies" do
    result = Movie.released 
    expected_results = Movie.where("released_on < ?", Time.now).order("released_on desc")
    
    assert_equal result.map(&:id), expected_results.map(&:id)
  end

  test "#upcoming, returns movies realeased in future" do
    result = Movie.upcoming 
    expected_results = Movie.where("released_on > ?", Time.now).order("released_on asc")
    
    assert_equal result.map(&:id), expected_results.map(&:id)
  end

  test "#hits, returns movies where total_gross >= 300000000" do
    result = Movie.hits 
    expected_results = Movie.released.where("total_gross >= 300000000").order(total_gross: :desc)
    
    assert_equal result.map(&:id), expected_results.map(&:id)
  end

  test ".flop, return true if total_gross < 22500000" do
    assert_not @movie.flop?
    
    @movie.update(total_gross: 0)
    assert @movie.flop?
  end
  
end
