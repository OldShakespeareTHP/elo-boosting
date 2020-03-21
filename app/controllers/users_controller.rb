class UsersController < ApplicationController
  before_action :check_user
  before_action :redirect_not_signed_in
  def show
    @user = User.find(params[:id])
  end
end
