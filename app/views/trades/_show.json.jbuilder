json.extract! trade, :id, :contest_id, :team_id, :quantity, :price, :security_id, :buy_sell, :customer_id, :created_at, :updated_at
json.trade_date display_date(trade.trade_date)
json.settlement_date display_date(trade.settlement_date)
json.security_name trade.security.name
json.customer_name trade.customer.name
