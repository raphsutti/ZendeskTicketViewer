require 'net/http'
require 'uri'
require 'json'
require 'openssl'

def authenticate(username, password)

  uri = URI.parse("https://firstorder.zendesk.com/api/v2/tickets.json")

  Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https', 
    :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth username, password

    response = http.request request

    if response.code.to_i === 200
      return true
    else
      puts "Failed to authenticate, error code: " + response.code
      return false
    end

  end
end