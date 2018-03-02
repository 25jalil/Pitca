class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart, only: [:create]
  
  include CartHelper
  include SessionHelper
  
  expose :product

  def create
    return unless product
    if session[:cart].keys.include?(product.category.to_s)
      flash[:notice] = "You have already selected food from the #{product.category} category"
    else
      result = cart_create(session[:cart], product)
      session[:cart] = result 
    end
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