module OrderHelper
  def order_create(cart)  
    cart.each do |product|
      order = Order.create!(product_id: product["product_id"], product_name: product["product_name"], product_price: product["product_price"], product_quantity: product["product_quantity"], user_id: current_user.id)
      OrderMailer.email_to_order(order, current_user.email).deliver_later
    end
  end
end
