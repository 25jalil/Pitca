module OrderHelper
  def order_create(cart)  
    cart.each do |product|
    	product = product.flatten
      order = current_user.orders.create!(product_id: product[0], product_name: product[1]["product_name"], product_price: product[1]["product_price"], product_quantity: product[1]["amount"])
      OrderMailer.email_to_order(order, current_user.email).deliver_later
    end
  end
end
