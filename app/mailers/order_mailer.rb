class OrderMailer < ApplicationMailer
  def email_to_order(order, email)
  	@email = email
  	@order = order
  	@url = 'localhost:3000'
   	mail(to: @email, subject: "You created new order")
  end
end
