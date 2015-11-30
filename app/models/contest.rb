class Contest < ActiveRecord::Base
  has_many :teams
  
  STATES = ["Not Started", "Started", "Paused", "Ended"]
  scope :active, ->() { where(:is_active => true)}
  
end
