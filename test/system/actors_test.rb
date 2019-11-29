require "application_system_test_case"

class ActorsTest < ApplicationSystemTestCase
  setup do
    @actor = actors(:one)
  end

  test "admin visiting the index" do
    sign_in users(:admin)
    visit actors_url
    assert_selector "h1", text: "ACTORS"
  end

  test "admin can't create an Actor without image" do
    sign_in users(:admin)
    visit actors_url
    click_on "New Actor"

    fill_in "Birth date", with: @actor.birth_date
    choose @actor.gender
    fill_in "Name", with: @actor.name
    click_on "Create Actor"

    assert_text "Actor failed to save."
  end

  test "admin creating an Actor" do
    sign_in users(:admin)
    visit actors_url
    click_on "New Actor"

    find('#actor_image').set(Rails.root + 'public/images/cruz.jpg')
    fill_in "Name", with: "Margott Robbie"
    fill_in "Birth date", with: "1996-01-01"
    choose 'female'
    click_on "Create Actor"

    assert_text "Actor was successfully created."
  end
end
