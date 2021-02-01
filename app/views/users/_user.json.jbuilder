json.extract! user, :id, :name, :email, :authsch_id, :password, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
