class Position < ActiveRecord::Base
  has_many :trades
  belongs_to :security
  belongs_to :team

  before_create:defaults
  def defaults
    self.quantity = 0 if self.quantity.nil?
  end

  before_save :compute_avg_price

  def compute_avg_price
    val = 0
    qty = 0
    self.quantity = 0
    self.trades.reload
    self.trades.each do |trade|
      if trade.buy?
        val += trade.value
        qty += trade.quantity
      end
      self.quantity += trade.quantity
    end
    self.average_price = qty > 0 ? val/qty : 0
  end

  def value
    self.quantity * self.average_price
  end

  def recompute_pnl
    Rails.logger.debug "recompute_pnl: Position #{self.id} for Team #{self.team_id}"
    # recompute
    # save
    # broadcast
  end
  
  after_save :broadcast
  def broadcast
    json_data = ApplicationController.new.render_to_string(
      :partial => '/positions/show.json', :locals => {:position=>self}
    )
    channel = "/positions/#{self.team.contest_id}/#{self.team_id}"
    Rails.logger.debug "Broadcasting #{json_data} on #{channel}"
    RestClient.post "http://localhost:9292/faye", message: {channel: channel, data: json_data}.to_json          
  end
end
