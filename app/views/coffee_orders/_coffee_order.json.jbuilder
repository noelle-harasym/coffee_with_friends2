json.extract! coffee_order, :id, :coffe_type_id, :dairy_type_id, :iced, :modifications_other, :rating, :picture, :date, :user_id, :created_at, :updated_at
json.url coffee_order_url(coffee_order, format: :json)
