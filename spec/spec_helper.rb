# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'weathersnapper.rb')
$LOAD_PATH << File.join(File.dirname(__FILE__), './fixtures')

require 'sinatra'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'pry'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

Capybara.app = Sinatra::Application

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  # config.mock_with :rspec
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Capybara::DSL
  Capybara.app = Sinatra::Application

  def app
    Sinatra::Application
  end
end
