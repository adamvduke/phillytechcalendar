class Calendar
  include MongoMapper::Document
  
  key :id, String, :required => true
  key :color, :default => '182C57'
end