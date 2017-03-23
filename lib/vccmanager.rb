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
  puts "3 - Delete an existing card"
  puts "\nPlease select an option: [1/2/3]"
  option = gets.chomp

  case option
  when "1"
  	puts "Chosen option is 1"
  when "2"
  	puts "Chosen option is 2"
  when "3"
  	puts "Chosen option is 3"
  else
  	puts "Wrong option. "
  end
  rescue
  	puts "Houston, we have a problem. We don't have an account with such token."
  end

end
