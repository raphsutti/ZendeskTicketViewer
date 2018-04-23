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
    if currentPage ==0
      pageView = false
    end
    pageViewer(currentPage)
    count = $ticketArray.length
    $maxPage = (count - 1) / $maxPerPage +1
    puts "page: #{currentPage} of #{$maxPage}"
    puts "to change page; input page number.. "
    currentPage = gets.chomp.to_i
  end
end

def pageViewer(currentPage)
  $maxPerPage = 25
  first = (currentPage - 1) * $maxPerPage
  # does not include last one
  last = currentPage * $maxPerPage -1
  $ticketArray[first..last].each { |i|  puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}" }
  currentPage +=1
end