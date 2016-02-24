require 'test_helper'

class UserRegistersAccountTest < ActionDispatch::IntegrationTest
  test "User registers account" do
    visit '/'
    click_on "register"

    fill_in "Username", with: "david"

    fill_in "Password", with: "password"

    click_on "Register"

    user = User.last
    assert "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, #{user.username}"
  end
end
