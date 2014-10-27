require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

  context "Individual Issues Page" do
    setup do
      DatabaseCleaner.start
    end

    teardown do
      DatabaseCleaner.clean
    end

    should "Be able to see issue description" do
      visit issue_path(issues(:three))
      assert page.has_content?(issues(:three).description), "Should see description"
      assert page.has_content?(issues(:three).tried_description), "Should see description"
      assert page.has_content?(issues(:three).user.email), "Should see description"
    end

    should "be able to see resolved check when resolved" do
      visit issue_path(issues(:three))
      assert page.has_content?("Resolved"), "Issue should be resolved"
    end

    should "be able to be resolved by the owner" do
      visit new_user_session_path
      fill_in "Email", with: users(:one).email
      fill_in "Password", with: default_password
      click_button "Log in"
      visit issue_path(issues(:four))
      assert page.has_content?("Unresolved"), "Issue should be unresolved"
      click_link "Resolve"
      assert page.has_content?("Resolved"), "Issue should now be resolved"
    end

    should "not be able to be resolved by anyone else" do

    end

  end

end
