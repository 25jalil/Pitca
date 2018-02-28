class Admin::StoresController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
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
end  
