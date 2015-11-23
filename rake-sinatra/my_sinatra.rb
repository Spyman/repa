require 'sinatra'
require 'rake'
require './my_middleware'
use MyMiddleware

get '/' do
  'Welcome to all'
end

get '/test' do
  '123'
end