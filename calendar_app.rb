require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'partial_helper'
require 'calendar_url_helper'

class CalendarApp < Sinatra::Base
  helpers Sinatra::PartialHelper
  helpers Sinatra::CalendarUrlHelper
  
  set :static, true
  set :public, File.dirname(__FILE__) + '/public'
  
  get '/' do
    ids = %w(phillytechcalendar@gmail.com h70l6uq02gllc4k9innk8qu28c@group.calendar.google.com) 
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