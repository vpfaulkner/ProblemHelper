require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do

    should "be able to register" do
      # Capybara.current_driver = :selenium
      DatabaseCleaner.clean
      visit new_user_registration_path
      fill_in "Email", with: "email@email.com"
      fill_in "Password", with: default_password, match: :prefer_exact
      fill_in "Password confirmation", with: default_password, match: :prefer_exact
      click_button "Sign up"

      assert page.has_content?("Logout"), "Should be logged in and have logout link"
      click_link("Logout")
    end

  end

end
