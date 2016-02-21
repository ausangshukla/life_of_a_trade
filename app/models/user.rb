class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  
  include DeviseTokenAuth::Concerns::User
  
  # Roles for users
  ADMIN = "Admin"
  TRADER = "Trader"
  OPS = "Ops"
  SIM = "Simulation"

  
end
