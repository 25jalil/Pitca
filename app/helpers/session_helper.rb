module SessionHelper
  def clear_session
    session[:cart] = nil
    session[:current_store] = nil
    session[:shipping] = nil
    session[:total_price]  = nil
    session[:recipient_adress] = nil
    session[:sender_coordinates] = nil
    session[:recipient_coordinates] = nil
    session[:price_to_km] = nil
    session[:coordinates] = nil
  end
end
