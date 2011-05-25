require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'

class CalendarApp < Sinatra::Base
  set :static, true
  set :public, File.dirname(__FILE__) + '/public'
  
  get '/' do
    haml :index
  end
  
  not_found do
    redirect to('/')
  end
end