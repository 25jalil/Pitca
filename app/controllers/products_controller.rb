class ProductsController < ApplicationController
  before_action :authenticate_user!

  expose :product_create, ->{ store.products.build(product_params) }
  expose :product
  
  def create
    authorize Product
    if product_create.save
      redirect_to store
    else
      flash[:error]= "error save"
      redirect_to root_path
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image)
    end
end
