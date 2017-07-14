class OrderedProductsController < ApplicationController
  before_action :set_cart, only: [:create]
  def create
    product = Product.find(params[:product_id])
    store = Store.find(params[:store_id])
    @ordered_product = OrderedProduct.new(product: product, store: store, cart: @cart, user: current_user, quantity: 1)
    if @ordered_product.save
      redirect_to store
    else
      redirect_to store
      falsh[:eroor] = "Notice"
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


