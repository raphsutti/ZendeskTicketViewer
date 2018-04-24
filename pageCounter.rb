require 'net/http'
require 'uri'
require 'json'
require 'openssl'

def pageCounter(username, password)
  uri = URI.parse("https://firstorder.zendesk.com/api/v2/tickets.json")
  Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https', 
    :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth username, password

    response = http.request request
    
    parsed_json = JSON.parse(response.body)
    count = parsed_json['count']
    # 1 page for 1-100 count
    pageCount = (count.to_i - 1) / 100 + 1
    return pageCount
  end
end