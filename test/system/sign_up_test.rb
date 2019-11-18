require "application_system_test_case"

class SignUpTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit new_user_registration_url
    assert_selector "h2", text: "SIGN UP"
  end

  test "visitor can signup" do
    visit new_user_registration_path

    fill_in "Email", with: "example@example.org"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"

    assert_text "Welcome! You have signed up successfully."
  end

  test "vistor can't signup wihtout email" do
    visit new_user_registration_path

    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"

    assert_selector "#error_explanation", text: "ERRORS PROHIBITED"
  end
end
