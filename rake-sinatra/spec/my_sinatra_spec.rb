ENV['RACK_ENV'] = 'test'

require './my_sinatra'
require 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'test one' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'test two' do
    get '/test'
    expect(last_response.body).to eq('1')
  end
end