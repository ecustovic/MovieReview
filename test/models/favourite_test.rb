require 'test_helper'

class FavouriteTest < ActiveSupport::TestCase
  setup do
    @fav = favourites(:one)
  end

  test "one fixture is valid" do
    assert @fav.valid?
  end
end
