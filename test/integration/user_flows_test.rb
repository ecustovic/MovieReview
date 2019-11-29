require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "login and browse site" do
    get "/users/sign_in"
    assert_response :success

    post "/users/sign_in", params: { user: { email: users(:admin).email, 
    password: "topsecret123" }}
    follow_redirect!
    page_text = response.body.squish
    
    assert_includes page_text, 'Signed in successfully.'
  end
end