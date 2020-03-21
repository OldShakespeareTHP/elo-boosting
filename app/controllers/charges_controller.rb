class ChargesController < ApplicationController
  before_action :redirect_not_signed_in
  def new
  end
  
  def create
    # Amount in cents
    @amount = current_user.boosts.last.total_price

    customer = Stripe::Customer.create({
      name: current_user.username,
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    unless charge.nil?
      BoostMailer::boost_email(customer, charge).deliver_now
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
