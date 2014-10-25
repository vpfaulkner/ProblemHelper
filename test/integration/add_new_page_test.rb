require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

  context "Add new page" do
    setup do
      visit new_issue_path
    end

    context "Not logged in" do
      should "not be able to submit issue" do
        assert_equal current_path, new_user_session_path, "Should not be able to submit issue without logging in"
      end
    end

    context "Logged in" do

      setup do
        visit new_user_session_path
        fill_in "Email", with: users(:one).email
        fill_in "Password", with: default_password
        click_button "Log in"
      end

      teardown do
        click_link("Logout")
      end

      context "Without valid issue parameters" do
        should "be able to submit issue" do
          visit new_issue_path
          fill_in "What is your issue?", with: "Here's my issue"
          fill_in "What have you tried?", with: "I've tried everything"
          click_button "Create Issue"

          assert page.has_content?("Here's my issue"), "Answer should be displayed"
        end
      end

      context "With valid issue credentials" do
        should "not be able to submit issue" do
          visit new_issue_path
          fill_in "What is your issue?", with: ""
          fill_in "What have you tried?", with: ""
          click_button "Create Issue"

          refute page.has_content?("Here's my issue"), "Answer should be displayed"
        end
      end
    end

  end
end
