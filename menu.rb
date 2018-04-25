require 'io/console'
require './authenticate.rb'
require './storeTicketArray.rb'
require './ticketsViewer.rb'
require './singleTicketViewer.rb'

def menu
  menu = true
  while menu
    puts ""
    puts "Options:"
    puts "'quit' - exit"
    puts "'view' - display all tickets"
    puts "'view {id}' - display ticket by id"
    input = gets.chomp
  
    puts "input: " + input
    case input
    when "quit"
      puts "Thank you for using First Order Ticket Viewer. Have a nice day"
      menu = false
      break
    when "view"
      # pass in default page 1 to ticketsViewer()
      ticketsViewer(1)
    when /^(view\ [0-9]+)/
      # regex to match the id input by user
      singleTicketViewer(input[5..-1])
    else
      puts "Invalid option - '#{input}'"
    end
  end
end

