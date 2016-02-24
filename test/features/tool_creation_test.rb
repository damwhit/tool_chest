require "test_helper"

class ToolCreationTest < ActionDispatch::IntegrationTest

  def test_user_can_create_a_tool
    user = User.create(username: "david", password: "password")

    visit '/'

    click_on "login"

    fill_in "Username", with: user.username
    fill_in "Password", with: "password"

    click_on "Login"

    visit new_tool_path

    fill_in "Name", with: "Hammer"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"

    click_button "Create Tool"

    assert_equal current_path, tool_path(Tool.last)

    within(".tool_info") do
      assert page.has_content?("Hammer")
      assert page.has_content?("10.99")
      assert page.has_content?("10")
    end
  end
end
