class StoresController < ApplicationController
  before_action :find_store, only: [:edit, :update, :destroy]

  def index
    @stores = Store.all.order('created_at DESC')
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.save

    redirect_to @store
  end

  def show
    @store = Store.find(params[:id])
    @store_products = Product.where(store_id: params[:id])
    if session[:url] == nil 
       session[:url] = request.url
    elsif session[:url] != request.url
      session[:url] = request.url
      session[:product_id] = nil
      session[:product_name] = nil
      session[:product_price] = nil
      session[:product_quantity] = nil
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def find_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:company, :address)
    end
end
