class Customer < ActiveRecord::Base
  RATINGS = ["AAA", "AA", "A", "BBB", "BB", "B", "C", "Junk"]
  after_save ThinkingSphinx::RealTime.callback_for(:customer)
end
