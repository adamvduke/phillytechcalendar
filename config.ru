$LOAD_PATH << './config' << './lib' << './models'

require 'mongo_config'
require 'calendar'

Calendar.find_or_create_by_id('phillytechcalendar@gmail.com')

require './calendar_app'
run CalendarApp.new