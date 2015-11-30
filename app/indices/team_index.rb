ThinkingSphinx::Index.define :team, :with => :real_time do
  
  # fields
  indexes name
  
  set_property :enable_star => 1
  set_property :min_infix_len => 3
  set_property :dict => :keywords
  
  set_property :field_weights => {
    :name  => 10
  }
  
end
