class RiotAccount < ApplicationRecord
  belongs_to :user
  has_many :boosts
  validates :username, presence: true
  validates :password, presence: true
  validates :server, presence: true 
end
