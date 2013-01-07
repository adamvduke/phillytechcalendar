require 'sinatra/base'
require 'partial_helper'
require 'calendar'
require 'json'

class CalendarApp < Sinatra::Base
  helpers Sinatra::PartialHelper

  set :static, true
  set :public, File.dirname(__FILE__) + '/public'

  before do
    @all_calendars = Calendar.all(:order => 'name ASC')
    if params[:ids] && !params[:ids].empty?
      @checked_calendars = Calendar.where(:cal_id.in => params[:ids]).all(:order => 'name ASC')
    else
      @checked_calendars = []
    end
  end

  get '/' do
    haml :index
  end

  get '/calendars' do
    content_type 'application/json', :charset => 'utf-8'
    JSON.generate(@checked_calendars)
  end

  get '/about' do
    haml :about
  end

  not_found do
    redirect to('/')
  end
end
