require 'spec_helper'

describe "Sinatra App" do
  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/snapper/)
  end

  xit "should respond to GET/zipcode" do
    get '/zipcode'
    last_response.should be_ok
    last_response.body.should match(/{\"asdf\":*/)
  end
end

describe "Requests", :type => :request do
  before(:all) do
    @forecast = JSON.parse(IO.read('./spec/fixtures/wunderground_10day.json'))
  end

  before(:each) do
    weathergetter = double(WeatherGetter)
    weathergetter.stub(:get_forecast).and_return(@forecast)
  end

  xit "fetches weather by zipcode" do
    visit '/'
    #fill_in :postalcode, :with => '94530'
    find(:xpath, "//input[@id='postalcode']").set "94530"
    click_button 'Get my weather'
    page.has_content?('pop')
  end
end
