json.array!(@positions) do |position|
  json.extract! position, :id, :contest_id, :team_id, :name, :quantity, :average_price, :pnl, :eod_mark
  json.url position_url(position, format: :json)
  json.security do
	json.partial! '/securities/show', security: position.security
  end
  json.partial! '/layouts/permissions', entity: position
end
