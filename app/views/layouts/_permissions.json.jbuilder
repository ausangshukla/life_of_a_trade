json.permissions do
  	json.read can?(:read, entity)
  	json.manage can?(:manage, entity)
end