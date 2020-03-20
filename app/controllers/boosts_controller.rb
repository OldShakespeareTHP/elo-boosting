class BoostsController < ApplicationController
  before_action :redirect_not_signed_in

  def new
    @riot_accounts_usernames = current_user.riot_accounts.collect { |ra| ra.username }
  end

  def create
    params = boost_params
    riot_account = RiotAccount.find_by(username: params[:riot_account])
    params.delete("riot_account")
    boost = Boost.new(params)
    boost.riot_account = riot_account
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
