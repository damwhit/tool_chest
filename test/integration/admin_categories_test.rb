require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin can see categories index" do
    admin = User.create(username: "david", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    assert page.has_content?("All Categories")
  end

  test "default user does not see admin categories index" do
    regular_dude = User.create(username: "david", password: "password", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(regular_dude)

    visit admin_categories_path

    refute page.has_content?("All Categories")

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
