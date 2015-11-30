json.array!(@contests) do |contest|
  json.extract! contest, :id, :is_active, :name, :description, :state, :currentTradeDate, :startDate, :auto_inc_days
  json.url contest_url(contest, format: :json)
  json.partial! '/layouts/permissions', entity: contest
end
