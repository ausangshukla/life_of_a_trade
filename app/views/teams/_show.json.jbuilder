json.extract! team, :id, :name, :description, :contest_id, :is_active, :created_at, :updated_at
json.contest team.contest.name if team.contest
json.partial! '/layouts/permissions', entity: team
