module CartHelper
  def cart_create(cart_session, product) 
		product_to_cart = { product.id => {amount: 1, product_name: product.name, product_price: product.price, cost_of_shipping: session[:cost_of_shipping]}} #значение 1 это первоночальное количество продукта   
    if cart_session.include?(product.id.to_s) #имеет ли сессия уже добавленный продукт?
      cart_session[product.id.to_s]["amount"] += 1 #если имеет добавляем +1 на количество.
      cart_session.rehash #сохраняем новое значение в хеше
    else  
      cart_session.merge!(product_to_cart) #если не имеет, добавляем новый продукт в корзину.
    end  
  end
end