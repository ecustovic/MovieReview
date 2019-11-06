require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  setup do
    @genre = genres(:action)
  end

  test "action fixture is valid" do
    assert @genre.valid?
  end
end
