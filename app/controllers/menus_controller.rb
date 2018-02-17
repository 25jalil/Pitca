class MenusController < ApplicationController
  before_action :authenticate_user!
  
  expose :menu
  
  
  def index
    @menus = Menu.all.flatten
  end

  def create
    (params[:menu][:product_ids]).shift
    menu_new = Menu.create(menu_date: params[:menu][:menu_date], store_id: params[:store_id], user_id: current_user.id)
    (0...(params[:menu][:product_ids]).size).each do |i|
      product = Product.find((params[:menu][:product_ids])[i])
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


  private

    def menu_params
      params.require(:menu).permit(:menu_date, {product_ids: []})
    end
end
