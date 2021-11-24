json.extract! store, :id, :recipe_name, :recipe_description, :recipe_calories, :recipe_price, :created_at, :updated_at
json.url store_url(store, format: :json)
