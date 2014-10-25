require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def issue_valid_data
    {:description => "Here's my issue",
     :tried_description => "I've tried this",
     :user_id => users(:one).id}
  end

  def issue_invalid_data

  end

  context "GET #new" do

    should "create blank issue" do
      get :new
      assert assigns["issue"], "Should have a blank issue"
      assert render_template("new")
    end
  end

  context "POST #create" do

    context "When not logged in" do

      should "be redirected to form" do
        post :create
        assert_redirected_to new_user_session_path

      end

    end

    context "When logged in" do

      context "With invalid data" do

        should "be redirected to form" do

        end

      end

      context "With valid data" do

        should "Create new Issue instance" do

        end

        should "Be redirected to new Issue" do

        end

      end

    end

  end
end
