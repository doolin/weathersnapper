require 'rubygems'
require 'sinatra'
require 'haml'
require 'kramdown'
#require 'json'

require './lib/weathergetter'
require './lib/displaydate'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

#'\b[0-9]{5}(?:-[0-9]{4})?\b'

get %r{/zipcode/(?<zipcode>[0-9]{5})} do
  @zipcode = params[:zipcode]
  markdown :testem, :layout_engine =>:haml
end

get '/' do

  if params[:zipcode]
    wg = WeatherGetter.new
    @zipcode = params[:zipcode]
    @forecast = wg.get_forecast(@zipcode)
    @forecastday = wg.parse_wunderground_10day(@forecast)
  end

  haml :index
end

post '/' do

  if params[:zipcode]
    @dd = DisplayDate.new
    wg = WeatherGetter.new
    @zipcode = params[:zipcode]
    @forecast = wg.get_forecast(@zipcode)
    @forecastday = wg.parse_wunderground_10day(@forecast)
  end

  haml :index
end

