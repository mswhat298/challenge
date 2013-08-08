json.array!(@users) do |user|
  json.extract! user, :name, :fullname, :date, :email, :password, :avatar
  json.url user_url(user, format: :json)
end
