class StorePolicy

  def initialize(user, post)
    @current_user = user
    @store = post
  end

  def new?
    @current_user.admin? || @current_user.seller?
  end

  def create?
    @current_user.admin? || @current_user.seller?
  end

  def edit?
    @current_user.admin? || @current_user.seller?
  end

  def update?
    @current_user.admin? || @current_user.seller?
  end

  def destroy?
    @current_user.admin? || @current_user.seller?
  end

end
