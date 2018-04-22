require './menu.rb'
require './authenticate.rb'
require './storeTicketArray.rb'

if authenticate($username,$password)
  storeTicketArray($username, $password)
  menu()
end