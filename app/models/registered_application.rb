class RegisteredApplication < ApplicationRecord
  belongs_to :user
  
  default_scope { order('created_at DESC') }
  
  validates :name, presence: true
  validates :url, presence: true
end
