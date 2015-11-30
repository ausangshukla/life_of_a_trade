ThinkingSphinx::Index.define :customer, :with => :real_time do
  
  # fields
  indexes name
  indexes credit_rating
  indexes account_number
  
  set_property :enable_star => 1
  set_property :min_infix_len => 3
  set_property :dict => :keywords
  
  set_property :field_weights => {
    :name  => 10,
    :credit_rating => 5,
    :account_number => 8
  }
  
end
