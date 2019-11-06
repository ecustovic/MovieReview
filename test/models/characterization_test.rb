require 'test_helper'

class CharacterizationTest < ActiveSupport::TestCase
  setup do
    @characterization = characterizations(:one)
  end

  test "one fixture is valid" do
    assert @characterization.valid?
  end
end
