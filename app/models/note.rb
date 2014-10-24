class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  validates :issue_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
end
