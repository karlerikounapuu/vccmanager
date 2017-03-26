require 'vccmanager/version'
require 'vccmanager/Accounting'
require 'vccmanager/CardManager'

module Vccmanager
  # Your code goes here...
  #Accounting.list_users
  # uuid_14902092633122 for test user
  puts 'Welcome to VCCManager!'
  puts 'To proceed with this application, please provide your user token:'

  uid = gets.chomp
  puts "Provided uid is #{uid}. Requesting user data..."
  
  begin
  customername = Accounting.retrieve_user(uid)
  system "clear"

  puts "Welcome back #{customername}! What would you like to do?"
  puts "\n1 - Generate a new virtual card"
  puts "2 - View/Manage existing cards"
  puts "\nPlease select an option: [1/2]"
  option = gets.chomp

  case option
  when "1"
  	puts "\nTo generate a new virtual card, we need to know your preferred card product token. Please provide it below."
  	puts "Card product token:"
  	pid = gets.chomp
  	puts "Retrieving information about card product #{pid}..."
  	CardManager.generate_vcc(uid, pid)
  when "2"
  	CardManager.list_vcc(uid)
  	puts "\nTo view virtual card's full details, please provide card token. "
  	puts "Card token:"
  	card_token = gets.chomp
  	puts "Provided card token is #{card_token}. Requesting data..."
  	CardManager.view_vcc(card_token)
  else
  	puts "Wrong option. "
  end
  rescue
  	puts "Houston, we have a problem. We don't have an account with such token."
  end

end
