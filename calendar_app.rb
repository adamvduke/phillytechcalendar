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
    haml :index
  end
  
  not_found do
    redirect to('/')
  end
end