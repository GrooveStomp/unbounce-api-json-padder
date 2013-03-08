require 'sinatra'
require 'unbounce_client'
require 'json'

ub = UnbounceClient.new('3e17e6bbe6bec8854b189de1a629e66c')

get '/' do
  "Success"
end

# This expects a valid Unbounce Page UUID.
#
get '/page-stats-jsonp/*' do
  page_id = request.url.split('/page-stats-jsonp/').last
  page_stats = ub.page(page_id).tests['current'].to_json.to_s

  if params['jsonp']
    "#{params['jsonp']}(#{page_stats});"
  else
    page_stats
  end
end
