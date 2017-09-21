class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  before_action :check_session, only: [:pre_order]
  
  expose_decorated :orders, ->{ current_user.orders }
  expose_decorated :order

  def index
    order = Order.where(user_id: current_user.id).last
    orders = order.products_orders
    render component: 'Orders', props: { orders: orders }
  end

  def create
    order = current_user.orders.build(store_id: session[:current_store],
                                      shipping: session[:shipping],
                                      total_price: session[:total_price],
                                      recipient_adress: session[:recipient_adress],
                                      recipient_coordinates: session[:recipient_coordinates],
                                      sender_coordinates: session[:sender_coordinates])
    session[:cart].values.flatten.each do |product|
      order.products_orders.build(product_name: product["product_name"],
                                  product_price: product["product_price"],
                                  amount: product["amount"])
    end
    if order.save! 
      clear_session
      redirect_to orders_path, notice: "Successfully"
    else
      flash[:notice] = "Please enter a valid address!"
      render "pre_order"
    end
  end

  def recipient_adress
  end

  def pre_order
    order = Order.new(order_params)
    session[:recipient_coordinates] = Geocoder.coordinates(order.recipient_adress)
    @distance = Geocoder::Calculations.distance_between(session[:sender_coordinates], session[:recipient_coordinates]).round(1)
    session[:shipping] = @distance * session[:price_to_km]
    @current_order = session[:cart].values
    session[:recipient_adress] = order.recipient_adress
    
    markers = []
    markers << session[:recipient_coordinates]
    markers << session[:sender_coordinates]

    $hash_pre_order = Gmaps4rails.build_markers(markers) do |point, marker|
      marker.lat point[0]
      marker.lng point[1]
    end
  end

  def destroy
  end
  
  private

    def check_session
      redirect_to root_path if session[:cart] == nil
    end

    def clear_session
      session[:cart] = nil
      session[:current_store] = nil
      session[:shipping] = nil
      session[:total_price]  = nil
      session[:recipient_adress] = nil
      session[:sender_coordinates] = nil
      session[:recipient_coordinates] = nil
      session[:price_to_km] = nil
    end

    def order_params
      params.require(:order).permit(:recipient_adress)
    end
end
