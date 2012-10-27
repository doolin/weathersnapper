## Get forecast from wunderground

require 'typhoeus'
require 'json'

include Typhoeus

APIKEY = "ca6bf06c16a970c9"

class WeatherGetter

  attr_reader :forecast

  def initialize(zipcode)
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
