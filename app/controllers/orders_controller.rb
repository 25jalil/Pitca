class OrdersController < ApplicationController
  def create
    if session[:cart].nil?
      @orders = Order.where(user_id: current_user.id)
      render "show"
    else  
      session[:cart].each do |product|
        Order.create!(store_id: product[0], product_id: product[1], product_name: product[2], product_price: product[3], product_quantity: product[4], user_id: current_user.id)
      end
      @orders = Order.where(user_id: current_user.id)
      session[:cart] = nil
      render "show"
    end  
  end

  def show
  end
end