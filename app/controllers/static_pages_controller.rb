class StaticPagesController < ApplicationController
  include SessionHelper

  before_action :clear_session
  
  def root
  	session[:сart] = nil
  end
end
