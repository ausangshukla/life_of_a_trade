json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :email, :role, :team, :company_id
  json.url user_url(user, format: :json)
end
