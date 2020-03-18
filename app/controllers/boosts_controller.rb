class BoostsController < ApplicationController
  def new

  end

  def create
    boost = Boost.new(boost_params)
    if boost.save
      redirect_to root_path
    else
      flash[:alert] = boost.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def boost_params
    params.require(:boost).permit(:queue, :current_rank, :desired_rank, :riot_account)
  end
end
