# frozen_string_literal: true
require 'spec_helper'

describe 'Sinatra App' do
  it 'responds to GET' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/snapper/)
  end

  # Not sure where I was going with this, but it's working now.
  it 'responds to GET/zipcode with json' do
    get '/zipcode/12345'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/{\"asdf\":*/)
  end
end

describe 'Requests', type: :request do
  before :all do
    @forecast = JSON.parse(IO.read('./spec/fixtures/wunderground_10day.json'))
  end

  before :each do
    weathergetter = double(WeatherGetter)
    allow(weathergetter).to receive(:get_forecast).and_return(@forecast)
  end

  xit 'fetches weather by zipcode' do
    get '/'
    # fill_in "postalcode", :with => '94530'
    find(:xpath, "//input[@id='postalcode']").set '94530'
    click_button 'Get my weather'
    page.has_content?('pop')
  end
end
