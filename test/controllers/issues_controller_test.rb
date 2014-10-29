require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def issue_valid_data
    { issue: {:description => "Here's my issue",
     :tried_description => "I've tried this",
     :user_id => users(:one).id,
     :resolved => false} }
  end

  def issue_invalid_data
    { issue: {:description => "",
     :tried_description => "",
     :user_id => users(:one).id} }
  end

  context "POST #create" do

    context "When not logged in" do

      should "be redirected to login" do
        post :create
        assert_redirected_to new_user_session_path, "Should be prompted to login"
      end

    end

    context "When logged in" do
      setup do
        sign_in users(:one)
      end

      teardown do
        sign_out users(:one)
      end

      context "With invalid data" do

        should "be redirected to form" do
          post :create, issue_invalid_data

          assert_redirected_to new_issue_path, "Should be redirected to new issue path"
        end

      end

      context "With valid data" do
        setup do
          post :create, issue_valid_data
        end

        should "Create new Issue instance" do
          assert assigns["issue"], "Should have a new issue"
        end

        should "Be redirected to new Issue" do
          assert_redirected_to issue_path(assigns[:issue]), "Should be redirected to new issue path"
        end

      end

    end

  end
end
