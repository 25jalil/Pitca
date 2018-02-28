json.array! @menus do |menu|
  json.title "Menu"
  json.start menu[:menu_date].to_time.strftime('%Y-%m-%dT%H:%M:%S')
  json.url admin_store_menu_info_path(store_id: menu[:store_id], id: menu[:id])
end
