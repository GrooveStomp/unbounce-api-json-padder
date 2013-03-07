require 'sinatra'
require 'debugger'
require 'unbounce_client'

ub = UnbounceClient.new('dfb87f5470eb3e187cac97fbdded16bf')

# This expects a valid Unbounce Page UUID.
#
get '/page-stats-jsonp/*' do
  page_id = request.url.split('/page-stats-jsonp/').last
  page_stats = ub.page(page_id).tests['current'].to_s

  if params['jsonp']
    "#{params['jsonp']}(#{page_stats})"
  else
    page_stats
  end
end
