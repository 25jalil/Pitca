class ProductsController < ApplicationController
  def create
    @store = Store.find(params[:post_id])
    @product = @store.products.build(params[:comment].permit(:name))
    if @product.save
      redirect_to store_products_path
    else
      flash[:error]= "error save"
      redirect_to root_path
    end
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
