class CartsController < ApplicationController
  include CartHelper
  before_action :authenticate_user!
  expose :product

  def session_cart
    result = cart_create(session[:cart], product)
    session[:cart] = result
    redirect_to request.referrer
  end

  def destroy_cart
    session[:cart] = nil
    redirect_to request.referrer 
  end
end