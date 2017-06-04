class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many   :events
  
  default_scope { order('created_at DESC') }
  
  validates :name, presence: true
  validates :url, presence: true
end
