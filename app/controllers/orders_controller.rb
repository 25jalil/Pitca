class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  expose :orders, ->{current_user.orders}
  expose :order    
  
  def create
    if session[:cart].nil?
      redirect_to request.referrer, notice: "Cart empty"
    else  
      session[:cart].each do |product|
        Order.create!(product_id: product["product_id"], product_name: product["product_name"], product_price: product["product_price"], product_quantity: product["product_quantity"], user_id: current_user.id)
      end
      session[:cart] = nil
    end  
      render "show"
  end

  def show
  end
end