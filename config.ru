$LOAD_PATH << './config' << './lib' << './models'

require 'mongo_config'
require './calendar_app'
run CalendarApp.new