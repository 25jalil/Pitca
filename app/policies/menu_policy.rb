class MenuPolicy
  attr_reader :current_user, :model

  def initialize(current_user, menu)
    @current_user = current_user
    @menu = menu
  end

  def index?
    security
  end

  def show?
    security 
  end

  def update?
    security
  end

  def destroy?
    security
  end

  private 
    def security
      @current_user.admin?
    end
end
