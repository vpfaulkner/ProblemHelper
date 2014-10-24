require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do

    context "when not logged in" do
      should "see login in the navbar" do
        # Capybara.current_driver = :selenium
        visit root_path
        if page.has_content?("Logout")
          click_link("Logout")
        end
        assert page.has_content?("Login"), "Should have login link"
      end

      should "be able to register" do
        visit new_user_registration_path
        fill_in "Email", with: "email@email.com"
        fill_in "Password", with: default_password, match: :prefer_exact
        fill_in "Password confirmation", with: default_password, match: :prefer_exact
        click_button "Sign up"

        assert page.has_content?("Logout"), "Should be logged in and have logout link"
        click_link("Logout")
      end

      should "be able to login" do
        visit new_user_session_path
        fill_in "Email", with: users(:one).email
        fill_in "Password", with: default_password
        click_button "Log in"
        assert page.has_content?("Logout"), "Should be logged in and have logout link"
        click_link("Logout")
      end

    end

    context "when logged in" do

      setup do
        visit new_user_session_path
        fill_in "Email", with: users(:one).email
        fill_in "Password", with: default_password
        click_button "Log in"
      end

      teardown do
        click_link("Logout")
      end

    end

  end

end
