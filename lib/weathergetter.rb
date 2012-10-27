## Get forecast from wunderground

require 'typhoeus'
require 'json'

include Typhoeus

APIKEY = ENV['WUNDERGROUND_APIKEY']

class WeatherGetter

  attr_reader :forecast

  def initialize
  end

  def get_forecast(zipcode)
    @hydra = Typhoeus::Hydra.new
    url = "http://api.wunderground.com/api/#{APIKEY}/forecast10day/q/#{zipcode}.json"
    @forecast = make_request(url)
  end


  def make_request(url)

    request = Typhoeus::Request.new(url,
            :method        => :get,
            :timeout       => 5000, # milliseconds
            :cache_timeout => 60) # seconds
    @hydra.queue(request)
    @hydra.run
    response = request.response

    data = JSON.parse(response.body)
    return data
  end

end

