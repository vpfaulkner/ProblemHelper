class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  validates :description, presence: true
  validates :tried_description, presence: true
  validates :user_id, presence: true
  validates :resolved, presence: true
end
