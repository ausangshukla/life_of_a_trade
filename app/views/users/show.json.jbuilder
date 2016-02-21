json.extract! @user, :id, :last_name, :first_name, :email, :role, :account_balance, :blocked_amount :created_at, :updated_at
if current_user.id == @user.id
	json.extended_permissions do
		[Contest, Team, User, Security, Customer, Trade, Position].each do |entity|
			json.set! entity.to_s do
				json.read can?(:read, entity)
				json.create can?(:create, entity)
			end 
		end
	end
end