json.array!(securities) do |security|
  json.extract! security, :id, :name, :liquidity, :ticker, :description, :price, :asset_class, :region, :tick_size, :sector
  json.url security_url(security, format: :json)
  json.partial! '/layouts/permissions', entity: security
end
