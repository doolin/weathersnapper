require 'rubygems'
require 'sinatra'
require 'haml'
require 'kramdown'

require './lib/weathergetter'
#require 'json'

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

