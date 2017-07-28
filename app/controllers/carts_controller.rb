class CartsController < ApplicationController
  include CartHelper
  before_action :authenticate_user!
  before_action :initialize_cart, only: [:session_cart]
  expose :product

  def session_cart
    return unless product
    result = cart_create(session[:cart], product)
    session[:cart] = result
    redirect_to request.referrer
  end

  def destroy_cart
    return unless product
    session[:cart] = nil
    redirect_to request.referrer 
  end

  private 

    def initialize_cart
      session[:cart] ||= {} 
    end
end