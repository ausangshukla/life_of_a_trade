json.extract! @customer, :id, :name, :credit_rating, :bank, :account_number, :created_at, :updated_at
json.partial! '/layouts/permissions', entity: @customer