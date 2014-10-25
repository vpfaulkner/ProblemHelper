require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Issues Index" do

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

    should "be able to navigate to an individual problem page" do
      visit root_path
      abbrev_description = issues(:one).description.split[0...15].join(' ')

      assert page.has_content?(abbrev_description), "Should see abbreviated description"
      click_link(abbrev_description)
      assert_equal current_path, issue_path(issues(:one)), "Should be able to click to issue page"
    end

  context "Individual Issues Page" do
    setup do
      visit issue_path(issues(:three))
    end
    should "Be able to see issue description" do
      assert page.has_content?(issues(:three).description), "Should see description"
      assert page.has_content?(issues(:three).tried_description), "Should see description"
      assert page.has_content?(issues(:three).user.email), "Should see description"
    end

    should "See resolved check when resolved" do
      # assert page.has_css?('i'), "Should see description"
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
