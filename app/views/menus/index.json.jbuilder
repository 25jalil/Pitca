json.array! @menus do |menu|
  json.id menu[:id]
  json.title menu[:id]
  json.start menu[:menu_date].to_time.strftime('%Y-%m-%dT%H:%M:%S')
end
