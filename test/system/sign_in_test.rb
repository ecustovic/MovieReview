require "application_system_test_case"

class SignInTest < ApplicationSystemTestCase
  test "admin can signin" do
    visit new_user_session_path

    fill_in "Email", with: users(:admin).email
    fill_in "Password", with: "topsecret123"
    click_on "Log in"

    assert_text "Signed in successfully."
  end

  test "visitor can't signin" do
    visit new_user_session_path

    fill_in "Email", with: "novi_mail@gmail.com"
    fill_in "Password", with: "123456"
    click_on "Log in"

    assert_text "Invalid Email or password."
  end
end
