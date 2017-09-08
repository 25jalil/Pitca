class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  before_action :check_session, only: [:pre_order]

  expose_decorated :orders, ->{current_user.orders}
  expose_decorated :order

  
  def create
    @order = Order.new(order_params)
    session[:store_location] = Store.last.geocode
    session[:order_location] = Geocoder.coordinates(@order.recipient_adress)
    render "long"
  end

  def long
  end

  def create123
    @order = current_user.orders.build(order_params)
    @order.order_info = session[:cart]
    if @order.save
      redirect_to root_path, notice: "Successfully"
    else
      flash[:notice] = "Please enter a valid address!"
      render 'pre_order'
    end
  end

  def recipient_adress
  end

  def pre_order
    @current_order = session[:cart].values
    @cost_of_shipping = session[:cost_of_shipping]
  end

  def destroy
  end

  def show
    render component: 'Orders', props: { orders: orders }
  end

  private

    def check_session
      redirect_to root_path if session[:cart] == nil
    end

    def order_params
      params.require(:order).permit(:recipient_adress)
    end
end