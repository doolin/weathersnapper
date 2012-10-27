require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/snapper/)
  end

=begin
  it "should respond to GET/?type=ASDF" do
    get '/?type=ASDF'
    last_response.should be_ok
    last_response.body.should match(/{\"asdf\":*/)
  end

  it "should respond to GET/?type=Lorem" do
    get '/?type=Lorem'
    last_response.should be_ok
    last_response.body.should match(/{\"lorem\":*/)
  end
=end

end

describe "Requests", :type => :request do

=begin
  it "should generate asdf text with button click" do
    visit '/'
    click_button 'ASDF'
    #page.has_text?('ASDF-FOO')
    page.has_content? 'ASDF'
  end

  it "should generate latin with button click" do
    visit '/'
    click_button 'Lorem'
    page.has_content? "Lorem"
  end
=end

end

describe WeatherGetter do

  it "gets the weather for 94530" do
    wg = WeatherGetter.new(94530)
    #puts wg.forecast
  end

end
