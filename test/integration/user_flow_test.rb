require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do
    setup do
      DatabaseCleaner.clean
    end

    teardown do
      # DatabaseCleaner.clean
    end


    should "see login in the navbar" do
      visit root_path
      if page.has_content?("Logout")
        click_link("Logout")
      end
      assert page.has_content?("Login"), "Should have login link"
    end

    should "be able to login" do
      # Capybara.current_driver = :selenium
      visit new_user_session_path
      fill_in "Email", with: "tester1@stack.com" #users(:one).email
      fill_in "Password", with: default_password
      binding.pry
      click_button "Log in"
      binding.pry
      assert page.has_content?("Logout"), "Should be logged in and have logout link"
      click_link("Logout")
    end

    # should "be able to navigate to an individual problem page" do
    #   visit root_path
    #   abbrev_description = issues(:one).description.split[0...15].join(' ')
    #
    #   assert page.has_content?(abbrev_description), "Should see abbreviated description"
    #   click_link(abbrev_description)
    #   assert_equal current_path, issue_path(issues(:one)), "Should be able to click to issue page"
    # end
    #
    # should "be able to navigate to new issue page" do
    #   visit new_user_session_path
    #   fill_in "Email", with: users(:one).email
    #   fill_in "Password", with: default_password
    #   click_button "Log in"
    #   visit root_path
    #   click_link("Submit an Issue")
    #
    #   assert_equal current_path, new_issue_path, "Should be able to navigate to new issue path"
    # end

  end

end
