class Calendar
  include MongoMapper::Document
  
  key :cal_id, String, :required => true, :index => true
  key :name, String, :require => true
  key :color, :default => '182C57'
end