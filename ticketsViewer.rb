def ticketsViewer(currentPage)
  pageView = true
  $maxPerPage = 25
  count = $ticketArray.length
  $maxPage = (count - 1) / $maxPerPage +1
  
  # While in page view mode
  while pageView
    if currentPage === "quit"
      pageView = false
      puts "Exiting view page mode.."
      break
    # check if input value is in page range
    elsif !currentPage.to_i.between?(1,$maxPage)
      pageView = false
      puts "Invalid input: #{currentPage}"
      # default to first page
      puts "Displaying first page.."
      ticketsViewer(1)
    else
      puts ""
      pageViewer(currentPage.to_i)
      puts "page (#{currentPage} of #{$maxPage})", ""
      puts "To quit view pages, input 'quit'"
      puts "To change page, input page number.. "
      currentPage = gets.chomp
    end
  end
end

# Compile list for the page requested
def pageViewer(currentPage)
  first = (currentPage - 1) * $maxPerPage
  # does not include last item
  last = currentPage * $maxPerPage -1
  $ticketArray[first..last].each { |i| puts "id:#{i['id']}: #{i['subject'].ljust(45)} author:#{i['requester_id']} created:#{i['created_at']}" }
end