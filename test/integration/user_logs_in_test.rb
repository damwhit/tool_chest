require 'test_helper'

class UserLogsInTest < ActionDispatch::IntegrationTest
  test "User can log into existing account" do
    user = User.create(username: "david", password: "password")

    visit '/'

    click_on "login"

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_on "Login"

    assert_equal current_path, "/users/#{user.id}"

    assert page.has_content? "Welcome, #{user.username}"

  end
end
