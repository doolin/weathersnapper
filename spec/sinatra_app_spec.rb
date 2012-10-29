
require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/snapper/)
  end

=begin
  it "should respond to GET/zipcode" do
    get '/zipcode'
    last_response.should be_ok
    last_response.body.should match(/{\"asdf\":*/)
  end
=end

end

describe "Requests", :type => :request do

  before(:each) do
    @forecast = JSON.parse(IO.read('./spec/fixtures/wunderground_10day.json'))
    #weathergetter = double('weathergetter')
    weathergetter = double(WeatherGetter)
    weathergetter.stub(:get_forecast).and_return(@forecast)
  end

  it "fetches weather by zipcode" do
    ####weathergetter = double('weathergetter')
    #weathergetter = double(WeatherGetter)
    #weathergetter.stub(:get_forecast).and_return(@forecast)
    visit '/'
    #fill_in :postalcode, :with => '94530'
    find(:xpath, "//input[@id='postalcode']").set "94530"
    click_button 'Get my weather'
    page.has_content?('pop')
    #page.has_content? 'ASDF'
  end

=begin
  it "should generate latin with button click" do
    visit '/'
    click_button 'Lorem'
    page.has_content? "Lorem"
  end
=end

end
