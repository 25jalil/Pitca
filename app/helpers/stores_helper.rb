module StoresHelper
  def store_owner?(store)
    if store.user_id == current_user.id
      true
    else
    	false
    end
  end
end
