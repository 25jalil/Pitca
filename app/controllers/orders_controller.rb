class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  
  expose_decorated :orders, ->{current_user.orders}
  
  def create
    if session[:cart].any?
      order = Order.create!(order_info: session[:cart], user_id: current_user.id)
      render "show"
    else
      redirect_to request.referrer, notice: "unfortunately are unable to create a shopping order"
    end  
  end

  def pre_order
    @current_order = session[:cart].values
    @cost_of_shipping = session[:cost_of_shipping]
    session[:cart] = nil
    session[:cost_of_shipping] = nil
  end

  def destroy
  end

  def show
    render component: 'Orders', props: { orders: orders }
  end
end