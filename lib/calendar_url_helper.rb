module Sinatra
  module CalendarUrlHelper
    def build( calendar_ids, options = {})
      
      # up to @style these need to be concatenated to form
      # the url for the calendar using the & character
      # src attribute for the iframe
      @src = "https://www.google.com/calendar/embed?"

      # show the print link or not
      @src << "showPrint=" << (options[:show_print] || "0") << "&"

      # show the drop down that lists the aggregated calendars or not
      @src << "showCalendars=" << (options[:show_calendars] || "0") << "&"

      # height of the calendar
      @src << "height=" << (options[:height] || "600") << "&"

      # the start day of the week Sunday=1 Monday=2 Saturday=7
      @src << "wkst=" << (options[:week_start] || "1") << "&"

      # background color for the calendar
      @src << "bgcolor=%23" << (options[:bg_color] || "c0c0c0") << "&"

      # could potentially build up a larger list of calendars here
      # phillytechcalendar
      calendar_ids.each do | calendar_id |
        @src << "src=#{CGI::escape(calendar_id)}" << "&"
        @src << "color=%23" << (options[:event_color] || "182C57") << "&"
      end
      
      # time zone
      time_zone = options[:time_zone]
      time_zone = CGI::escape(time_zone) if time_zone
      @src << "ctz=" << (time_zone || "America%2FNew_York")
    end
  end  
end