class Admin::UsersController < ApplicationController
  def show
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.boosts.each { |boost| boost.destroy }
    @user.riot_accounts.each { |riot_account| riot_account.destroy }
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_back(fallback_location: root_path)
  end
end
