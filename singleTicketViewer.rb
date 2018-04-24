
def singleTicketViewer(id)
  ticket = $ticketArray.detect {|ticket| ticket["id"] === id }
  puts ticket
end