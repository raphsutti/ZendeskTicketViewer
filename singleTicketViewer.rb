def singleTicketViewer(id)
  count = $ticketArray.length
  ticket = $ticketArray.detect {|ticket| ticket['id'] === id.to_i }
  # if detect method returns nil, display error
  if !ticket
    puts "\nId: #{id} does not exist"
  else
    puts "\nId:#{ticket['id']} Subject: #{ticket['subject']}\nAuthor id:#{ticket['requester_id']}\nCreated:#{ticket['created_at']}\nDescription:#{ticket['description']}"
  end
end