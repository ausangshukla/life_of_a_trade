json.extract! position, :id, :contest_id, :team_id, :name, :quantity, :average_price, :pnl, :eod_mark, :created_at, :updated_at
json.security do
	json.partial! '/securities/show', security: position.security
end
