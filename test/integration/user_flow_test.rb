require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do

    context "when not logged in" do
      should "see login in the navbar" do
        visit root_path
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
        save_and_open_page
        assert page.has_content?("Logout"), "Should be logged in and have logout link"
        click_link("Logout")
      end

    end

  end

end
