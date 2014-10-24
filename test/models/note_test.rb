require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should validate_presence_of(:issue_id)
  should validate_presence_of(:user_id)
  should validate_presence_of(:text)
end
