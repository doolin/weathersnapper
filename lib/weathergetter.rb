require 'typhoeus'
require 'json'
require 'pry'

include Typhoeus

APIKEY = ENV['OPEN_WEATHER_MAP_APIKEY']

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
    "APPID=#{APIKEY}"
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
    @forecastday = forecast['forecast']['simpleforecast']['forecastday']
  end
end
