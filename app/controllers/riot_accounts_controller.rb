class RiotAccountsController < ApplicationController
  before_action :check_user
  def index
  end

  def show
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
    #@acc = RiotAccount.find()
    puts params
    puts check_user
  end
end
