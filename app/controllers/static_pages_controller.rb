class StaticPagesController < ApplicationController
  include SessionHelper

  before_action :clear_session
  
  def root
  end
end
