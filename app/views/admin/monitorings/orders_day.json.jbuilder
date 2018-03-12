json.array! @orders_date do |item|
  json.title "Total #{item[:total_price]}"
  json.start item[:created_at]
end
