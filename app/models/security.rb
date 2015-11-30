class Security < ActiveRecord::Base
  ASSET_CLASSES = ["Stock", "Bond", "Derivative"]
  REGIONS = ["US", "EU", "EMEA", "APAC"]
  SECTORS = ["Auto", "Pharma", "Manufacturing", "Construction", "Technology"]
  LIQUIDITY = ["None", "Low", "Medium", "High", "Very High"]
    
  after_save ThinkingSphinx::RealTime.callback_for(:security)
  
end
