class OrdersController < ApplicationController
  include OrderHelper
  include SessionHelper
  after_action  :clear_session, only: [:pre_order]
  before_action :authenticate_user!
  before_action :check_session, only: [:pre_order, :recipient_adress]
  
  expose_decorated :orders, ->{ current_user.orders }
  expose_decorated :order

  def index
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
                                  amount: product["amount"], 
                                  rendition: false)
    end
    if order.save! 
      clear_session
      redirect_to order, notice: "Successfully"
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
    Rails.logger.debug("one #{session[:sender_coordinates]}")
    Rails.logger.debug("two #{session[:recipient_coordinates]}")
    @distance = Geocoder::Calculations.distance_between(session[:sender_coordinates], session[:recipient_coordinates]).round(1)
    session[:shipping] = @distance * session[:price_to_km]
    @current_order = session[:cart].values
    session[:recipient_adress] = order.recipient_adress
    
    markers = []
    markers << session[:recipient_coordinates]
    markers << session[:sender_coordinates]

    @hash_pre_order = Gmaps4rails.build_markers(markers) do |point, marker|
      marker.lat point[0]
      marker.lng point[1]
    end
  end

  def destroy
  end

  def show
    order = Order.where(user_id: current_user.id).last
    orders = order.products_orders
    rok = "jkjbjkbhk"
    render component: 'Orders', props: { orders: orders, rok: rok }
  end
  
  private

    def check_session
      redirect_to root_path if session[:cart] == nil
    end

    def order_params
      params.require(:order).permit(:recipient_adress)
    end
end
