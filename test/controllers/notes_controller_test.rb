require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

    setup do
      @note = notes(:one)
    end

    test "should create note" do
      assert_difference('Note.count') do
        post :create, note: @note.text
    end

      assert_redirected_to issue_path(assigns(:issue))
    end

    test "should update note" do
      patch :update, id: @issue, note: @note.text
      assert_redirected_to issue_path(assigns(:issue))
    end

    test "should destroy note" do
      assert_difference('Note.count', -1) do
        delete :destroy, id: @note
      end
    end
end
