class Admin::MonitoringsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  expose :users, ->{User.all}
  expose :user
  
  def index
  	authorize user
  end
end