class BoostMailer < ApplicationMailer
  default 'Content-Transfer-Encoding' => '7bit'
  def boost_email(customer, charge)
    @url = 'https://elo-boosting.herokuapp.com/'
    @customer = customer
    @charge = charge
    
    @admin_email = "versailles.panacea@gmail.com"
    mail(to: "#{customer.email},#{@admin_email}", subject: 'Commande effectuée !')
  end
end
