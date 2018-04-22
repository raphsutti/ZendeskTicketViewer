# require './menu.rb'
require 'net/http'
require 'uri'
require 'json'
require 'openssl'
require './pageCounter.rb'

def ticketViewer(username, password)
  puts "loading data..."
  pageCount = pageCounter(username, password)
  # for count > 100, another page request required
  currentPage = 1

  # loop through all the pages
  while currentPage <= pageCount do

    uri = URI.parse("https://firstorder.zendesk.com/api/v2/tickets.json?page=#{currentPage}")

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https', 
      :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth username, password

      response = http.request request
      
      parsed_json = JSON.parse(response.body)
      ticketArray = parsed_json['tickets']
      # count = parsed_json['count']
      
      ticketArray.each do |i|
        puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}"
        # puts "--#{i['created_at']}--"
        # puts "id:#{i['id']}: #{i['subject']}"
        # puts "initiator:#{i['requester_id']}"
        # puts "#{i['description']}"
        # puts "-- end of ticket --"
        # puts ""  
      end

      # puts "Total ticket count: #{count}"
      # puts ""

    end

    currentPage +=1
  end
end