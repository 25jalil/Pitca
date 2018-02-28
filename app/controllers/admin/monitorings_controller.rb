class Admin::MonitoringsController < ApplicationController
  layout "admin"
  include Admin::MonitoringsHelper

  before_action :authenticate_user!
  
  expose :users, ->{User.all}
  expose :user
  
  def index
    authorize user
  end
  
  def all_orders
    @orders = Order.includes(:user).all
  end

  def all_days
  end

  def order
    order = Order.includes(:products_orders).where(id: params[:id])
    products_order = order.last.products_orders
    render component: 'Admin_order', props: { products_order: products_order, orders_user: order }
  end

  def menus
    @menus = Menu.all
  end

  def menu_info
    @store = params[:store_id]
    @menu = Menu.find(params[:id])
    @products = Product.products_menu(@menu_id)
  end
end  
