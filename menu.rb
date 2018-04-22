require 'io/console'
require './authenticate.rb'
require './ticketViewer.rb'

puts "--- First Order Ticket Viewer ---"
puts "Username: "
$username = gets.chomp
puts "Password: "
$password = STDIN.noecho(&:gets).chomp

def menu
  menu = true
  while menu == true
    puts ""
    puts "Options:"
    puts "'quit' - exit"
    puts "'view' - display all tickets"
    puts "'view {id}' - display ticket by id"
    puts ""
    
    input = gets.chomp
  
    # puts "username: " + username
    # puts "password: " + password
    puts "input: " + input
    case input
    when "quit"
      puts "Thank you for using First Order Ticket Viewer"
      menu = false
      break
    when "view"
      ticketViewer($username, $password)
    else
      puts "Invalid option - '#{input}'"
    end
  end
end

if authenticate($username,$password)
  menu()
end