json.extract! @contest, :id, :name, :is_active, :description, :created_at, :updated_at, :state, :auto_inc_days

json.currentTradeDate display_date(@contest.currentTradeDate)
json.startDate display_date(@contest.startDate)

json.teams do
	json.partial! 'teams/index', teams: @contest.teams
end
json.partial! '/layouts/permissions', entity: @contest

