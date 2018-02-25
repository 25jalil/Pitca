class Admin::MonitoringsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  
  expose :users, ->{User.all}
  expose :user
  
  def index
    authorize user
  end
  
  def all_orders
    @menus = Menu.all
  end

  def all_days
  end
end  
