require 'net/http'
require 'uri'
require 'json'
require 'openssl'

# def ticketsViewer()
#   $ticketArray.each do |i|
#     puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}"
#   end
# end

def ticketsViewer(currentPage)
  pageView = true
  while pageView
    pageViewer(currentPage)
    puts "current page: #{currentPage}"
    puts "input page number: "
    currentPage = gets.chomp.to_i
    if currentPage == 0
      pageView = false
    end
  end
end

def pageViewer(currentPage)
  maxPerPage = 25
  first = (currentPage - 1) * maxPerPage
  last = currentPage * maxPerPage
  $ticketArray[first,last].each { |i|  puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}" }
  currentPage +=1
end