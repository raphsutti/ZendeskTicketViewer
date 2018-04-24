def singleTicketViewer(id)
  count = $ticketArray.length
  # need to change count to largest id
  if id.to_i > count
    puts "id #{id} out of range"
    return false
  end
  # Need to throw error when id not found
  ticket = $ticketArray.detect {|ticket| ticket['id'] === id.to_i }
  puts "id:#{ticket['id']}: #{ticket['subject']}\nauthor:#{ticket['requester_id']} created:#{ticket['created_at']}\ndescription:#{ticket['description']}"
end