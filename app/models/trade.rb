class Trade < ActiveRecord::Base
  belongs_to :security
  belongs_to :customer
  belongs_to :team
  belongs_to :user
  belongs_to :position
  
  before_create :new_position  
  after_create :update_position 
  
  def new_position
    if self.position == nil
      pos_params = { security_id:self.security_id, team_id: self.team_id, contest_id: self.contest_id }
      existing_pos = Position.where(pos_params).first
      self.position = existing_pos ? existing_pos : Position.new(pos_params)
      self.position.save  
      self.position_id = self.position.id
    end
  end
  
  def update_position
    self.position.save  
  end
  
  def value
    self.quantity * self.price
  end
  
  def buy?
    buy_sell == "Buy"
  end
  
 
  
  after_save :broadcast
  def broadcast
    json_data = ApplicationController.new.render_to_string(
      :partial => '/trades/show.json', :locals => {:trade=>self}
    )
    
    channel = "/trades/#{self.team.contest_id}/#{self.team_id}"
    Rails.logger.debug "Broadcasting #{json_data} on #{channel}"
    
    RestClient.post "http://localhost:9292/faye", message: {channel: channel, data: json_data}.to_json          
  end
end
