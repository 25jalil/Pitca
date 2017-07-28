module OrderHelper
  def order_create(cart)  
    cart.each do |product|
    	product = product.flatten
      order = Order.create!(product_id: product[0], product_name: product[2], product_price: product[3], product_quantity: product[1], user_id: current_user.id)
      OrderMailer.email_to_order(order, current_user.email).deliver_later
    end
  end
end
