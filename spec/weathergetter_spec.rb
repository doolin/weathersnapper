# frozen_string_literal: true

require 'spec_helper'

describe WeatherGetter do
  before(:all) do
    @json = JSON.parse(IO.read('./spec/fixtures/wunderground_10day.json'))
  end

  it 'gets the weather for 94530' do
    wg = WeatherGetter.new
    forecast = wg.get_forecast(94_530)
    binding.pry
    expect(forecast['cod']).to be 401
    expect(forecast['message']).to match('Invalid API key')
    # forecast.should include('forecast')
  end

  xit "extracts wunderground's 10 day txt_forecast" do
    wg = WeatherGetter.new
    fcd = wg.parse_wunderground_10day(@json)
    # fcd.should  include('date')
    fcd.should have(10).items
  end
end
