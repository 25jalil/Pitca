class ProductsController < ApplicationController
  before_action :authenticate_user!

  expose :store
  expose :products, ->{ store.products }
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

  def session_cart
    if product 
      if session[:cart].nil?
        session[:cart] ||= []
        product1 = {product_id: product.id, product_name: product.name, product_price: product.price, product_quantity: 1} 
        session[:cart] << product1
      else
        var = true
        session[:cart].map do |product2| 
          if product2["product_id"] == product.id
            product2["product_quantity"] += 1
            var = false
          end
        end
        if var == true
          product1 = {product_id: product.id, product_name: product.name, product_price: product.price, product_quantity: 1} 
          session[:cart] << product1
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
