require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  test "user logs out and sees index" do
    user = User.create(username: "david", password: "password")

    visit '/'

    click_on "login"

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_on "Login"

    click_on "logout"

    assert_equal current_path, root_path

    refute page.has_content? "Welcome, #{user.username}"

    assert page.has_content? "login"
  end
end
