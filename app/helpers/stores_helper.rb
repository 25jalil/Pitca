module StoresHelper
  def store_owner?(store)
    store.user_id == current_user.id
  end

  def store_owner_id?(store)
  	store == current_user.id
  end
end
