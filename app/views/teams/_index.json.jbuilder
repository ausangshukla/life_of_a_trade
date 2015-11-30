json.array!(teams) do |team|
  json.extract! team, :id, :is_active, :name, :description, :contest_id
  json.url team_url(team, format: :json)
  json.contest team.contest.name if team.contest 
  json.partial! '/layouts/permissions', entity: team
end
