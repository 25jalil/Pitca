module CartHelper
  def cart_create(cart_session, product) 
		if product 
		  if cart_session.nil?
		    cart_session ||= []
		    product1 = {product_id: product.id, product_name: product.name, product_price: product.price, product_quantity: 1} 
		    cart_session << product1
		  else
		    var = true
		    cart_session.map do |product2| 
		      if product2["product_id"] == product.id
		        product2["product_quantity"] += 1
		        var = false
		      end
		    end
		    if var == true
		      product1 = {product_id: product.id, product_name: product.name, product_price: product.price, product_quantity: 1} 
		      cart_session << product1
		    end  
      end
      cart_session
    else
    	cart_session == nil
    end
  end
end
