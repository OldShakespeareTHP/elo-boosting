class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @riot_accounts = @user.riot_accounts
  end

  def edit

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
