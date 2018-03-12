class MenusController < ApplicationController
  before_action :authenticate_user!
  include StoresHelper
  expose :menu
  expose :menus
  expose :store, ->{ Store.find(session[:current_store]) } 

  def index
    @menus = Menu.all
  end

  def create
    authorize store
    (params[:menu][:product_ids]).shift
    menu = Menu.create(menu_date: params[:menu][:menu_date], store_id: params[:store_id], user_id: current_user.id)
    (0...(params[:menu][:product_ids]).size).each do |i|
      menu.products << Product.find((params[:menu][:product_ids])[i])
    end
      redirect_to store_path(params[:store_id]),notice: "Menu save!"
  end

  def new
    authorize store
  end

  def edit
    authorize store
  end

  def update
    authorize store
    if menu.update_attributes(menu_params)
      redirect_to store_path(params[:store_id]), notice: "Menu Updated"
    else
      redirect_to store_path(params[:store_id]), notice: "Unable to update menu"
    end
  end

  def destroy
    authorize store
    if menu.destroy
      redirect_to root_path, notice: "Menu deleted!"
    else
      redirect_to menu, notice: "Unable to delete menu!"
    end
  end

  def show
    @store = params[:store_id]
    @menu_id = params[:id]
    @products = Product.products_menu(@menu_id)  
  end

  private

    def menu_params
      params.require(:menu).permit(:menu_date, {product_ids: []})
    end
end
