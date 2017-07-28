module CartsHelper
  
  def calculated_price_product(product)
  	product[1]["amount"] * product[1]["product_price"]
  end
end
