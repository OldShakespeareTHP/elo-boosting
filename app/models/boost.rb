class Boost < ApplicationRecord
  RANKS = ["Bronze", "Silver", "Gold", "Platinum", "Master", "GrandMaster", "Challenger"]
  QUEUE = ["Solo/Duo", "Flex"]
  belongs_to :riot_account
  validates :queue, presence: true, inclusion: QUEUE
  validates :current_rank, presence: true, inclusion: RANKS
  validates :desired_rank, presence: true, inclusion: RANKS
  validate :desired_rank_must_be_bigger_than_current

  def desired_rank_must_be_bigger_than_current
    puts current_rank
    puts desired_rank
    puts RANKS.find_index(self.desired_rank)
    puts RANKS.find_index(self.current_rank)
    if RANKS.include?(current_rank) && RANKS.include?(desired_rank) && (RANKS.find_index(self.desired_rank) <= RANKS.find_index(self.current_rank))
      errors.add(:desired_rank, "must be bigger than current_rank")
    end
  end

  ## PRICES FOR EACH RANK
  # Bronze - Silver : 50$
  # Silver - Gold : 90$
  # Gold - Platinum : 140$
  # Platinum - Master : 400$
  # Master - GrandMaster : 300$
  # GrandMaster - Challenger : 900$

  def self.total_price(current_rank, desired_rank)
    hash_prices = {"Bronze" => 0, "Silver" => 90, "Gold" => 230, "Platinum" => 370, "Master" => 770, "GrandMaster" => 1070, "Challenger" => 1970}
    ret = hash_prices[desired_rank] - hash_prices[current_rank]
    ret >= 0 ? ret : 0
  end

  def total_price
    self.class.total_price(self.current_rank, self.desired_rank)
  end
end
