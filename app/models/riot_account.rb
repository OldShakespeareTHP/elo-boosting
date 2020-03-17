class RiotAccount < ApplicationRecord
  belongs_to :user
  has_many :boosts
end
