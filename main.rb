require './menu.rb'
require './authenticate.rb'
require './storeTicketArray.rb'

puts "--- First Order Ticket Viewer ---"
puts "Username: "
$username = gets.chomp
puts "Password: "
$password = STDIN.noecho(&:gets).chomp
puts "Authenticating.."
if authenticate($username,$password)
  storeTicketArray($username, $password)
  menu()
end