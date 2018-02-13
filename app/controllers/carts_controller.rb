class CartsController < ApplicationController
  include CartHelper
  include SessionHelper
  before_action :authenticate_user!
  before_action :initialize_cart, only: [:create]
  expose :product

  def create
    return unless product
    result = cart_create(session[:cart], product)
    session[:cart] = result
    redirect_to request.referrer || root_path
  end

  def delete_cart
    clear_session
    redirect_to stores_path 
  end

  private 

    def initialize_cart
      session[:cart] ||= {} 
    end
end