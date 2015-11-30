ThinkingSphinx::Index.define :security, :with => :real_time do
  
  # fields
  indexes name
  indexes ticker
  indexes asset_class
  indexes sector
  indexes region
  
  set_property :enable_star => 1
  set_property :min_infix_len => 3
  set_property :dict => :keywords
  
  set_property :field_weights => {
    :name  => 10,
    :ticker  => 10,
    :asset_class  => 5,
    :sector  => 7,
    :region  => 5
  }
  
end
