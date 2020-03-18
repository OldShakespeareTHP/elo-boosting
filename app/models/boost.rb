class Boost < ApplicationRecord
  RANKS = ["Bronze", "Silver", "Gold", "Platinum", "Master", "GrandMaster", "Challenger"]
  belongs_to :riot_account
  validates :queue, presence: true, inclusion: { in: %w(NA EUW EUNE LAN TR OCE LAN LAS) }
  validates :current_rank, presence: true, inclusion: RANKS
  validates :desired_rank, presence: true, inclusion: RANKS
  validate :desired_rank_must_be_bigger_than_current

  def desired_rank_must_be_bigger_than_current
    if !current_rank.empty? && !desired_rank.empty? && RANKS.find_index(self.desired_rank) <= RANKS.find_index(self.current_rank)
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

  def total_price
    ret = 0
    if current_rank == "Bronze" && desired_rank == "Silver"
      ret += 50
    elsif current_rank == "Silver" && desired_rank == "Gold"
      ret += 90
    elsif current_rank == "Gold" && desired_rank == "Platinum"
      ret += 140
    elsif current_rank == "Platinum" && desired_rank == "Master"
      ret += 400
    elsif current_rank == "Master" && desired_rank == "GrandMaster"
      ret += 300
    elsif current_rank == "GrandMaster" && desired_rank == "Challenger"
      ret += 900
    end
    ret
  end
end
