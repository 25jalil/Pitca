class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  
  expose_decorated :orders, ->{current_user.orders}
  
  def create
    if session[:cart].any?
      order_create(session[:cart])
      session[:cart] = nil
      render "show"
    else
      redirect_to request.referrer, notice: "unfortunately are unable to create a shopping order"
    end  
  end

  def destroy
  end

  def show
    render component: 'Orders', props: { orders: orders }
  end
end