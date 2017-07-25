module ProductsHelper
  
  def calculated_price_product(product)
  	price_product = product["product_price"] * product["product_quantity"]
  end

  def image(product)
    image_tag attachment_url(product, :product_image, :fill, 300, 300)
  end
end
