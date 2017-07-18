class StaticPagesController < ApplicationController

  def root
    session[:cart] = nil	
  end
end
