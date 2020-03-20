class UsersController < ApplicationController
  before_action :check_user
  def show
    @user = User.find(params[:id])
  end
end
