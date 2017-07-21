class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @store = Store.find(params[:store_id])
    @product = @store.products.build(product_params)
    authorize @product
    if @product.save
      redirect_to @store
    else
      flash[:error]= "error save"
      redirect_to root_path
    end
  end

  def session_cart
    if @product = Product.find(params[:product_id])
      if session[:cart].nil?
        session[:cart] ||= []
        product = {product_id: @product.id, product_name: @product.name, product_price: @product.price, product_quantity: 1} 
        session[:cart] << product
      else
        var = true
        session[:cart].map do |product| 
          if product["product_id"] == @product.id
            product["product_quantity"] += 1
            var = false
          end
        end
        if var == true
          product = {product_id: @product.id, product_name: @product.name, product_price: @product.price, product_quantity: 1} 
          session[:cart] << product
        end  
      end
    end
    redirect_to request.referrer
  end

  def destroy_cart
    session[:cart] = nil
    redirect_to request.referrer 
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :product_image)
    end
end
