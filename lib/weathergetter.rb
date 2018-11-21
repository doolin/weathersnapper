# frozen_string_literal: true

## Get forecast from wunderground

require 'typhoeus'
require 'json'
require 'pry'

include Typhoeus

# Dead, wunderground now belongs to IBM
APIKEY = ENV['WUNDERGROUND_APIKEY']

class WeatherGetter
  attr_reader :forecast, :forecastday

  def get_forecast(zipcode)
    @hydra = Typhoeus::Hydra.new
    @forecast = make_request(url(zipcode))
  end

  def url(zipcode)
    "api.openweathermap.org/data/2.5/weather?zip=#{zipcode},us&#{apikey}"
  end

  def apikey
    "APPID=#{ENV['OPEN_WEATHER_MAP_APIKEY']}"
  end

  def make_request(url)
    request = Typhoeus::Request.new(url,
                                    method: :get,
                                    timeout: 5000)
    @hydra.queue(request)
    @hydra.run
    response = request.response

    data = JSON.parse(response.body)
    data
  end

  def parse_wunderground_10day(forecast)
    # Bad zipcode produces forecast['response']['error']['type'] => "querynotfound"
    # Will need to do some spec for the above.
    @forecastday = forecast['forecast']['simpleforecast']['forecastday']
  end
end
