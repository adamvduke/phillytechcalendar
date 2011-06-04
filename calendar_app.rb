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
    @shared_calendars = Calendar.all()
    ids = @shared_calendars.collect do |calendar|
      calendar.id
    end
    @src = build_calendar_url(ids)

    # other attributes for the iframe
    set_iframe_properties()

    haml :index
  end
  
  def set_iframe_properties()
    @style = "border-width:0"
    @width = "800"
    @height = "600"
    @frame_border = "0"
    @scrolling = "no"
  end
  
  post '/view' do
    calendar_ids = params[:ids]
    set_iframe_properties()
    
    @src = build_calendar_url(calendar_ids)
    render_template :calendar_iframe
  end
  
  get '/about' do
    haml :about
  end
  
  not_found do
    redirect to('/')
  end
end