json.array!(@trades) do |trade|
  json.partial! '/trades/show', trade: trade
  json.partial! '/layouts/permissions', entity: trade
end
