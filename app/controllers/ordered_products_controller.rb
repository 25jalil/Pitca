class OrderedProductsController < ApplicationController
    
  def create
<<<<<<< HEAD
    @product = Product.find(params[:product_id])
    session[:product_id] = @product.id
    session[:product_name] = @product.name
    session[:product_price] = @product.price
    session[:product_quantity] = 1
    redirect_to store_path(session[:store_id])
  end

  def show
  end

  def destroy
    session[:product_id] = nil
    session[:product_name] = nil
    session[:product_price] = nil
    session[:product_quantity] = nil
    redirect_to stores_path
  end

=======
    product = Product.find(params[:product_id])
    store = Store.find(params[:store_id])
    ordered_product = OrderedProduct.find_by(product_id: product.id)
    if ordered_product
      ordered_product.quantity += 1
      ordered_product.save
      redirect_to store
    else
      product.ordered_products.build(store: store, cart: @cart, user: current_user)
      if product.save
        redirect_to store
      else
        flash[:eroor] = "Notice"
        redirect_to store
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    redirect_to stores_path
  end

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
>>>>>>> 8b2ebea89aa41a726da4f09a4cca6763c0bea2f2
end


