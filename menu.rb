require 'io/console'
require './authenticate.rb'
# signedIn = false

puts "--- First Order Ticket Viewer ---"
puts "Username: "
username = gets.chomp
puts "Password: "
password = STDIN.noecho(&:gets).chomp

if authenticate(username,password)

  puts ""
  puts "Logged in successful"
  puts "Type 'help' to view options or 'quit' to exit"
  puts ""
  puts "Options:"
  puts "'view' - display all tickets"
  puts "'view {id}' - display ticket by id"
  
  input = gets.chomp
  
  # puts "username: " + username
  # puts "password: " + password
  puts "input: " + input
  
end
# puts signedIn



# puts data