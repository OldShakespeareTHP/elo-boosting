class BoostsController < ApplicationController
  def new

  end

  def create
    Boost.create(boost_params)
  end

  private
  def boost_params
    params.require(:boost).permit(:queue, :current_rank, :desired_rank, :riot_account)
  end
end
