class OrderDecorator < Draper::Decorator
	delegate_all

  def conversion_rendition
	  if rendition == false
	  	order_rendition = "Not executed"
	  else
	  	order_rendition = "Executed"
	  end
  end
end
