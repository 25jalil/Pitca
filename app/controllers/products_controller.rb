class ProductsController < ApplicationController

  def create
    @store = Store.find(params[:store_id])
    @product = @store.products.build(product_params)
    if @product.save
      render @store
    else
      flash[:error]= "error save"
      redirect_to root_path
    end
  end

  def new
  end

  def index
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image)
    end
end
