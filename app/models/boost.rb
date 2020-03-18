class Boost < ApplicationRecord
  belongs_to :riot_account
  validates :queue, presence: true, inclusion: { in: %w(NA EUW EUNE LAN TR OCE LAN LAS) }
  validates :current_rank, presence: true, inclusion: { in: %w(B S G P M GM C) }
  validates :desired_rank, presence: true, inclusion: { in: %w(S G P M GM C) }
  validate :desired_rank_must_be_bigger_than_current
 
  private
  def desired_rank_must_be_bigger_than_current
    rank = ["B", "S", "G", "P", "M", "GM", "C"]

    if !current_rank.empty? && !desired_rank.empty? && rank.find_index(self.desired_rank) <= rank.find_index(self.current_rank)
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
    if current_rank == "B" && desired_rank == "S"
      ret += 50
    elsif current_rank == "S" && desired_rank == "G"
      ret += 90
    elsif current_rank == "G" && desired_rank == "P"
      ret += 140
    elsif current_rank == "P" && desired_rank == "M"
      ret += 400
    elsif current_rank == "M" && desired_rank == "GM"
      ret += 300
    elsif current_rank == "GM" && desired_rank == "C"
      ret += 900
    end
    ret
  end
end
