module ProductsHelper
	def image(product)
	  image_tag attachment_url(product, :product_image, :fill, 300, 300)
  end
end