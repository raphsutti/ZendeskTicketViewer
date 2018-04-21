# require './menu.rb'
require 'net/http'
require 'uri'
require 'json'
require 'openssl'

uri = URI.parse("https://firstorder.zendesk.com/api/v2/tickets.json")

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https', 
  :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth 'r.suttiyotin@gmail.com', 'test1234'

  response = http.request request
  
  # puts response.code
  # puts response.body
  parsed_json = JSON.parse(response.body)
  puts parsed_json['tickets'][1]['description']
end
