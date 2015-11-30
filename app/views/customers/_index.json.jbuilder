json.array!(customers) do |customer|
  json.extract! customer, :id, :name, :credit_rating, :bank, :account_number
  json.url customer_url(customer, format: :json)
  json.partial! '/layouts/permissions', entity: customer
end
