class StoresController < ApplicationController
  include StoresHelper
  before_action :authenticate_user!
  before_action :clear_session

  expose :stores, ->{ Store.all.order('created_at DESC') }
  expose :store_products, ->{ store.products }
  expose :store
  expose :store_create, ->{ current_user.stores.build(store_params) }
  expose :marker, -> { Store.find(params[:id]).to_gmaps4rails}
  
  def index
  end

  def new
    authorize Store
  end

  def create
    authorize Store
    if store_create.save
      redirect_to store, notice: "Successfully"
    else
      flash[:notice] = "Please enter a valid address!"
      render 'new'
    end
  end

  def show
    $hash = Gmaps4rails.build_markers(stores) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
    end
    session[:cost_of_shipping] = store.cost_of_shipping
    session[:current_store] = store.id
  end

  def edit
    authorize store
  end

  def update
    authorize store
    if store.update_attributes(store_params)
      redirect_to store_path(store), success: "Store Updated"
    else
      redirect_to store_path(store), success: "Unable to update store"
    end
  end

  def destroy
    authorize store
    if store.destroy
      redirect_to request.referrer, notice: "Store_deleted!"
    else
      redirect_to request.referrer, notice: "Unable to delete store!"
    end
  end

  private

    def store_params
      params.require(:store).permit(:company, :address, :cost_of_shipping)
    end

    def clear_session
      if session[:current_store] != store.id 
        session[:cart] = nil
        session[:cost_of_shipping] = nil
        session[:current_store] = nil
      end
    end
end
