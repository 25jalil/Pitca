class Admin::StoresController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  

  expose :stores, ->{ Store.all.order('created_at DESC') }
  expose :store_products, ->{ store.products }
  expose :store
  expose :store_create, ->{ current_user.stores.build(store_params) }
  expose :marker, -> { Store.find(params[:id]).to_gmaps4rails}
  
  def index
  end

  def show
    @hash = Gmaps4rails.build_markers(store) do |point, marker|
      marker.lat point.latitude
      marker.lng point.longitude
    end
  end
end  
