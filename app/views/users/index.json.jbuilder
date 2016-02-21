json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :email, :role, :account_balance, :blocked_amount
  json.url user_url(user, format: :json)
end
