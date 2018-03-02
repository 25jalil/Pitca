class MenuPolicy
  attr_reader :current_user, :model

  def initialize(current_user, store)
    @current_user = current_user
    @store = store
  end

  def edit?
    @current_user.admin? || store_owner_id?(@store)
  end

  def update?
    @current_user.admin? || store_owner_id?(@store)
  end

  def create?
    @current_user.admin? || store_owner_id?(@store)
  end

  def update?
    @current_user.admin? || store_owner_id?(@store)
  end

  def destroy?
    @current_user.admin? || store_owner_id?(@store)
  end

  private 
    def security
      @current_user.admin?
    end
end
