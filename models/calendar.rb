class Calendar
  include MongoMapper::Document

  key :cal_id, String, :required => true
  key :name, String, :require => true
  key :color, :default => '182C57'

  Calendar.ensure_index [[:cal_id, 1]], :unique => true

  def to_json(arg1, arg2)
    json = %Q|{"cal_id": "#{cal_id}", "color": "##{color}", "name": "#{name}", "textColor": "black", "url": #{calendar_url}}|
    json.to_s
  end

  private
    def calendar_url
      %Q|"https://www.google.com/calendar/feeds/#{cal_id}%40group.calendar.google.com/public/basic"|
    end
end