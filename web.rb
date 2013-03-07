require 'sinatra'

get '/jsonp/*' do
  str = request.url.split('/jsonp/').last
  str
end
