class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_inspect 
  
  layout "admin"

  before_action :initialize_session, only: :show

  expose :store
  expose :stores, ->{ Store.all.order('created_at DESC') }
  expose :store_products, ->{ store.products }
  
  def index
    session[:store_id] = nil
  end

  def show
  end

  private

  def initialize_session
    session[:store_id] = params[:id] 
  end

  def admin_inspect 
    redirect_to root_path, notice: "Log in as the administrator!" unless current_user.admin? 
  end 
end  
