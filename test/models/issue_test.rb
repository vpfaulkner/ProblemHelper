require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  should validate_presence_of(:description)
  should validate_presence_of(:tried_description)
  should validate_presence_of(:user_id)
  should validate_presence_of(:resolved)
end
