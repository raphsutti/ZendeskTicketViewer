# require './menu.rb'
require 'net/http'
require 'uri'
require 'json'
require 'openssl'
require './pageCounter.rb'

def ticketViewer()
  puts "loading data..."
  pageCount = pageCounter()
  # for count > 100, another page request required
  currentPage = 1

  # loop through all the pages
  while currentPage <= pageCount do

    uri = URI.parse("https://firstorder.zendesk.com/api/v2/tickets.json?page=#{currentPage}")

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https', 
      :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth 'r.suttiyotin@gmail.com', 'test1234'

      response = http.request request
      
      parsed_json = JSON.parse(response.body)
      ticketArray = parsed_json['tickets']
      count = parsed_json['count']
      
      ticketArray.each do |i|
        puts "----- id:#{i['id']} -----"
        puts "#{i['description']}"
        puts "----- end of ticket -----"
        puts ""  
      end

      puts "Total ticket count: #{count}"

    end

    currentPage +=1
  end
end