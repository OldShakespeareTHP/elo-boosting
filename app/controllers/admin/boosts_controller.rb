class Admin::BoostsController < ApplicationController
  def edit
    @boost = Boost.find(params[:id])
  end

  def update

  end

  def new 

  end

  def create

  end
end
