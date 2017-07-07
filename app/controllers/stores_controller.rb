class StoresController < ApplicationController
  before_action :find_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all.order('created_at DESC')
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    @store.save

    redirect_to @store
  end

  def show
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
