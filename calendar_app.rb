require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'

class CalendarApp < Sinatra::Base
  set :static, true
  set :public, File.dirname(__FILE__) + '/public'
  
  # a helper to render partial views
  # https://gist.github.com/306473
  helpers do
      def partial(template, *args)
        template_array = template.to_s.split('/')
        template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
        options = args.last.is_a?(Hash) ? args.pop : {}
        options.merge!(:layout => false)
        if collection = options.delete(:collection) then
          collection.inject([]) do |buffer, member|
            buffer << erb(:"#{template}", options.merge(:layout => false, :locals => {template_array[-1].to_sym => member}))
          end.join("\n")
        else
          haml(:"#{template}", options)
        end
      end
    end

  get '/' do

    # up to @style these need to be concatenated to form
    # the url for the calendar using the & character
    # src attribute for the iframe
    @src = "https://www.google.com/calendar/embed?"

    # show the print link or not
    @src = @src + "showPrint=0&"

    # show the drop down that lists the aggregated calendars or not
    @src = @src + "showCalendars=0&"

    # height of the calendar
    @src = @src + "height=600&"

    # the start day of the week Sunday=1 Monday=2 Saturday=7
    @src = @src + "wkst=1&"

    # background color for the calendar
    @src = @src + "bgcolor=%23c0c0c0&"

    # could potentially build up a larger list of calendars here
    # phillytechcalendar
    @src = @src + "src=phillytechcalendar%40gmail.com&"
    @src = @src + "color=%23182C57&"

    # some shared calendar
    @src = @src + "src=h70l6uq02gllc4k9innk8qu28c%40group.calendar.google.com&"
    @src = @src + "color=%23856508&"

    # time zone
    @src = @src + "ctz=America%2FNew_York"

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