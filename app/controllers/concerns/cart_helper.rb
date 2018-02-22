module CartHelper
  def cart_create(cart_session, product) 
	product_to_cart = { product.category => {amount: 1, product_name: product.name, product_price: product.price}}    
    if cart_session.include?(product.category.to_s) 
      cart_session.rehash #сохраняем новое значение в хеше
    else  
      cart_session.merge!(product_to_cart) 
    end  
  end
end