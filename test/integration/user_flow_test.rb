require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do
    setup do
      DatabaseCleaner.start
    end

    teardown do
      DatabaseCleaner.clean
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
      fill_in "Email", with: users(:one).email #users(:one).email
      fill_in "Password", with: default_password
      click_button "Log in"
      assert page.has_content?("Logout"), "Should be logged in and have logout link"
      click_link("Logout")
    end

    should "be able to navigate to an individual problem page" do
      visit root_path
      abbrev_description = issues(:four).description.split[0...15].join(' ')

      assert page.has_content?(abbrev_description), "Should see abbreviated description"
      click_link(abbrev_description)
      assert_equal current_path, issue_path(issues(:four)), "Should be able to click to issue page"
    end

  end

end
