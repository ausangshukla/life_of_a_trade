json.array!(@trades) do |trade|
  json.extract! trade, :id, :contest_id, :team_id,  :buy_sell, :quantity, :price, :security_id, :customer_id, :trade_date, :settlement_date
  json.url trade_url(trade, format: :json)
  json.security_name trade.security.name
  json.customer_name trade.customer.name
  json.partial! '/layouts/permissions', entity: trade
end
