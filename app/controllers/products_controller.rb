class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  expose :store
  expose :product_create, ->{ store.products.build(product_params) }
  expose :product
  
  def create
    authorize Product
    if product_create.save
      redirect_to store
    else
      redirect_to root_path, alert: "error save"
    end
  end

  def destroy
    authorize Product
    if product.destroy
      redirect_to store_path(store), notice: "Product deleted!"
    else
      redirect_to store_path(store), notice: "Unable to delete product!"
    end
  end


  private

    def product_params
      params.require(:product).permit(:name, :menu_date, :description, :price, :product_image)
    end
end
