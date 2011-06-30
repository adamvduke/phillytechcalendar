module Sinatra
  module CalendarUrlHelper
    def build_calendar_url( calendars, options = {})
      
      # up to @style these need to be concatenated to form
      # the url for the calendar using the & character
      # src attribute for the iframe
      url = "https://www.google.com/calendar/embed?"

      # show the print link or not
      url << "showPrint=" << (options[:show_print] || "0") << "&"

      # show the drop down that lists the aggregated calendars or not
      url << "showCalendars=" << (options[:show_calendars] || "0") << "&"

      # height of the calendar
      url << "height=" << (options[:height] || "600") << "&"

      # the start day of the week Sunday=1 Monday=2 Saturday=7
      url << "wkst=" << (options[:week_start] || "1") << "&"

      # background color for the calendar
      url << "bgcolor=%23" << (options[:bg_color] || "c0c0c0") << "&"

      # phillytechcalendar
      url << "src=#{CGI::escape('phillytechcalendar@gmail.com')}" << "&"
      url << "color=%23182C57&"
      
      if calendars
        calendars.each do | calendar |
          url << "src=#{CGI::escape(calendar.cal_id)}" << "&"
          url << "color=%23" << (calendar.color || "182C57") << "&"
        end
      end
      
      # time zone
      time_zone = options[:time_zone]
      time_zone = CGI::escape(time_zone) if time_zone
      url << "ctz=" << (time_zone || "America%2FNew_York")
    end
  end  
end