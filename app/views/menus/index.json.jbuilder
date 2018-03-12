json.array! @menus do |menu|
  json.title "Menu"
  json.start menu[:menu_date].to_time.strftime('%Y-%m-%dT%H:%M:%S')
  json.url store_menu_path(store_id: menu[:store_id], id: menu[:id])
end
