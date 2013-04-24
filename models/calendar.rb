class Calendar
  include MongoMapper::Document
  
  key :cal_id, String, :required => true
  key :name, String, :require => true
  key :color, :default => '182C57'

  Calendar.ensure_index [[:cal_id, 1]], :unique => true

  def to_json(arg1, arg2)
    url = %Q|"https://www.google.com/calendar/feeds/#{self.cal_id}%40group.calendar.google.com/public/basic"|
    color = self.color
    json = %Q|{"cal_id": "#{cal_id}", "url": #{url}, "color": "##{color}", "textColor": "black"}|
    json.to_s
  end
end