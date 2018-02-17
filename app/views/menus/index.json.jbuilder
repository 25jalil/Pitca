json.array! @menus do |menu|
  json.id menu[:id]
  json.start menu[:menu_date].to_time.strftime('%Y-%m-%dT%H:%M:%S')
  if signed_in?
    if menu[:user_id] == current_user.id
      json.url edit_menu_path(menu)
    else
      json.url menu_path(menu)
    end
  else
    json.url menu_path(menu)
  end
  json.my_events root_path
end

