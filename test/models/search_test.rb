require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  setup do
    @search = searches(:one)
  end

  test "search fixture is valid" do
    assert @search.valid?
  end
end
