class RiotAccountsController < ApplicationController
  before_action :check_user
  def index
  end

  def show
    @acc = RiotAccount.find(params[:id])
    respond_to do |format|
      format.html {
        redirect_to current_user
      }
      format.js {}
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @acc = RiotAccount.find(params[:id])
    @acc.destroy
    respond_to do |format|
      format.html {
        redirect_to current_user
      }
      format.js {}
    end
  end
end
