require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'partial_helper'
require 'calendar_url_helper'
require 'calendar'

class CalendarApp < Sinatra::Base
  helpers Sinatra::PartialHelper
  helpers Sinatra::CalendarUrlHelper
  
  set :static, true
  set :public, File.dirname(__FILE__) + '/public'
  
  get '/' do
    calendars = Calendar.all()
    ids = calendars.collect do |calendar|
      calendar.id
    end
    @src = build(ids)

    # other attributes for the iframe
    @style = "border-width:0"
    @width = "800"
    @height = "600"
    @frame_border = "0"
    @scrolling = "no"

    haml :index
  end

  not_found do
    redirect to('/')
  end
end