class UsersController < ApplicationController
  before_action :check_user
  def show
    @user = User.find(params[:id])
    redirect_to current_user unless current_user.admin? || @user == current_user
  end
end
