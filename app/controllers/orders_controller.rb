class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  before_action :check_session, only: [:pre_order]

  expose_decorated :orders, ->{current_user.orders}
  expose_decorated :order

  def create
    @order = current_user.orders.build(order_info: session[:cart], store_id: session[:current_store], recipient_adress: session[:recipient_adress], recipient_coordinates: session[:recipient_coordinates], sender_coordinates: session[:sender_coordinates])
    if @order.save!
      redirect_to current_user_orders_path, notice: "Successfully"
    else
      flash[:notice] = "Please enter a valid address!"
      render 'pre_order'
    end
  end

  def recipient_adress
  end

  def pre_order
    order = Order.new(order_params)
    session[:recipient_coordinates] = Geocoder.coordinates(order.recipient_adress)
    @distance = Geocoder::Calculations.distance_between(session[:sender_coordinates], session[:recipient_coordinates]).round(1)
    price_to_km = session[:price_to_km]
    @shipping = @distance * price_to_km
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

  def current_user_orders
    orders.map do |order|
      order.order_info.values.map do |product|
        Rails.logger.debug("My object: #{product.product_name}")  
      end  
    end
    render component: 'Orders', props: { orders: orders }
  end

  def show
    orders = Order.all_orders_user(1);
    @orders = []
    orders.each do |order|
      @orders << order.order_info.values
    end
    @orders.flatten!
    render component: 'Orders', props: { orders: @orders }
  end

  private

    def check_session
      redirect_to root_path if session[:cart] == nil
    end

    def order_params
      params.require(:order).permit(:recipient_adress)
    end
end