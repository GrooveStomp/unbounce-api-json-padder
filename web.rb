require 'sinatra'
require 'unbounce'

unbounce = Unbounce.new('dfb87f5470eb3e187cac97fbdded16bf')

get '/jsonp/*' do
  str = request.url.split('/jsonp/').last
  str

  puts unbounce.get(request)
end
