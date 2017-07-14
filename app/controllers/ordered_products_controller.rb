class OrderedProductsController < ApplicationController
  before_action :set_cart, only: [:create]

  def create
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
        falsh[:eroor] = "Notice"
        redirect_to store
      end
    end
  end

  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end


