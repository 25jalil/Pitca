class StorePolicy

  def initialize(user, post)
    @current_user = user
    @store = post
  end

  def new?
    manage?
  end

  def create?
    manage?
  end

  def edit?
    manage?
  end

  def update?
    manage?
  end

  def destroy?
    manage?
  end

  private
    def manage?
      @current_user.admin? || @current_user.seller?
    end
end
