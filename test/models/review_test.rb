require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
    @review = reviews(:one)
  end

  test "one fixture is valid" do
    assert @review.valid?
  end
end
