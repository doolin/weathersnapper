require 'spec_helper'

describe WeatherGetter do
  before(:all) do
    @json = JSON.parse(IO.read('./spec/fixtures/wunderground_10day.json'))
  end

  it 'gets the weather for 94530', :vcr do
    wg = WeatherGetter.new
    forecast = wg.get_forecast(94_530)
    weather = forecast['weather'].first

    expect(weather['main']).to eq 'Rain'
    expect(forecast['cod']).to be 200
    expect(forecast['name']).to eq 'Richmond'
    expect(forecast['message']).to be nil
  end

  xit "extracts wunderground's 10 day txt_forecast" do
    wg = WeatherGetter.new
    fcd = wg.parse_wunderground_10day(@json)
    # fcd.should  include('date')
    fcd.should have(10).items
  end
end
