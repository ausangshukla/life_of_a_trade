class Team < ActiveRecord::Base
  has_many :users
  has_many :trades
  
  belongs_to :contest
  
  after_save ThinkingSphinx::RealTime.callback_for(:team)
  scope :active, ->() { where(:is_active => true)}
  
  #  This is to ensure all users in this team have the current contest set correctly 
  after_save :update_user_contest
  def update_user_contest
    self.users.update_all(contest_id: self.contest_id)
  end  
  
  def recompute_pnl
    Rails.logger.debug "recompute_pnl: Team #{self.id}"
  end
end
