class OrdersController < ApplicationController
  include OrderHelper
  before_action :authenticate_user!
  before_action :check_session, only: [:pre_order]

  expose_decorated :orders, ->{current_user.orders}
  expose_decorated :order

  def create
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
    @order = Order.new(order_params)
    @recipient_coordinates = Geocoder.coordinates(@order.recipient_adress)
    @distance = Geocoder::Calculations.distance_between(session[:sender_coordinates], @recipient_coordinates).round(1)
    @price_to_km = session[:price_to_km]
    @shipping = @distance * @price_to_km
    @current_order = session[:cart].values

    @markers = []
    @markers << @recipient_coordinates
    @markers << session[:sender_coordinates]

    $hash_pre_order = Gmaps4rails.build_markers(@markers) do |point, marker|
      marker.lat point[0]
      marker.lng point[1]
      Rails.logger.debug("My object: #{marker.lat point[0]}")
      Rails.logger.debug("My object: #{marker.lng point[1]}")
    end
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