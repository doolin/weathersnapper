require 'rubygems'
require 'sinatra'
require 'haml'
#require 'json'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  haml :index
end

