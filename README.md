Zendesk Ticket Viewer (CLI)
1. Make sure Ruby is installed
2. Clone repository
3. Run ruby main.rb

This app separates function into various files

main.rb - startup file

authenticate.rb - checks if username and password is correct

menu.rb - displays main menu with option

storeTicketArray.rb - store json data into local hash for faster loads

pageCounter.rb - count how many json pages req (as API only allows max 100 per page)


ticketsViewer.rb - displays all tickets in pages with maximum of 25 tickets per page

singleTicketViewer.rb - display ticket by id in detail


I had fun making this project, thanks again for your time. Any feedback is appreciated!
