json.extract! user, :id, :name, :email, :password, :coffee_preference,
              :created_at, :updated_at
json.url user_url(user, format: :json)
