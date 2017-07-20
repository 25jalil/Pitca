class ProductPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @product = model
  end

  def create?
    @current_user.admin? || @current_user.seller?  
  end
end