require 'net/http'
require 'uri'
require 'json'
require 'openssl'

def ticketsViewer()
  $ticketArray.each do |i|
    puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}"
  end
end