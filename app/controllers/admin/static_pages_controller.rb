class Admin::StaticPagesController < ApplicationController
  def index
    @boosts = Boost.all
    @users = User.all
    @riot_accounts = RiotAccount.all
  end
end
