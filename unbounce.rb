require 'HTTParty'

class Unbounce
  include HTTParty

  base_uri 'https://api.unbounce.com'

  def initialize(api_key)
    @auth = { username: api_key, password: '' }
  end

  def get(request)
    self.class.get(request, @auth)
  end
end
