require 'io/console'
require './authenticate.rb'
require './ticketViewer.rb'
# signedIn = false

puts "--- First Order Ticket Viewer ---"
puts "Username: "
username = gets.chomp
puts "Password: "
password = STDIN.noecho(&:gets).chomp

def menu
  menu = true
  while menu == true
    puts ""
    puts "Options:"
    puts "'help' - display options"
    puts "'quit' - exit"
    puts "'view' - display all tickets"
    puts "'view {id}' - display ticket by id"
    
    input = gets.chomp
  
    # puts "username: " + username
    # puts "password: " + password
    puts "input: " + input
    case input
    when "quit"
      menu = false
      break
    when "help"
      next
    when "view"
      ticketViewer()
    else
      "Invalid option - #{input}"
    end
  end
end

if authenticate(username,password)
  menu()
end
# puts signedIn



# puts data