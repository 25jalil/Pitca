class MenusController < ApplicationController
  before_action :authenticate_user!
  
  expose :menu
  
  
  def index
    @menus = Menu.all
    Rails.logger.debug("My object: #{@menus.inspect}")
  end

  def create
    (params[:menu][:product_ids]).shift
    menu = Menu.create(menu_date: params[:menu][:menu_date], store_id: params[:store_id], user_id: current_user.id)
    (0...(params[:menu][:product_ids]).size).each do |i|
      menu.products << Product.find((params[:menu][:product_ids])[i])
    end
      redirect_to store_path(params[:store_id]),notice: "Menu save!"
  end

  def new
  end

  def destroy
    if menu.destroy
      redirect_to root_path, notice: "Menu deleted!"
    else
      redirect_to menu, notice: "Unable to delete menu!"
    end
  end

  def show
    @store = params[:store_id]
    menu_id = params[:id]
    @products = Product.products_menu(menu_id)  
  end


  private

    def menu_params
      params.require(:menu).permit(:menu_date, {product_ids: []})
    end
end
