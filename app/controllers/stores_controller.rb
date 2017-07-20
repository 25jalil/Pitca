class StoresController < ApplicationController
  before_action :find_store, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @stores = Store.all.order('created_at DESC')
  end

  def new
    @store = Store.new
    authorize @store
  end

  def create
    @store = Store.new(store_params)
    authorize @store
    if @store.save
      redirect_to @store, notice: "Successfully"
    else
      render 'new'
    end
  end

  def show
    @store = Store.find(params[:id])
    @store_products = Product.where(store_id: params[:id])
  end

  def edit
    @store = Store.find(params[:id])
    authorize @store
  end

  def update
    @store = Store.find(params[:id])
    authorize @store
    if @store.update_attributes(store_params)
      redirect_to store_path(@store), success: "Store Updated"
    else
      redirect_to store_path(@store), success: "Unable to update store"
    end
  end

  def destroy
    @store = Store.find(params[:id])
    authorize @store
    if @store.destroy
      redirect_to request.referrer, notice: "Store_deleted!"
    else
      redirect_to request.referrer, notice: "Unable to delete store!"
    end
  end

  private

    def find_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:company, :address)
    end

    def delete_session
      session[:cart] = nil
    end
end
