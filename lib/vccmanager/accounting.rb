class accounting

require 'net/http'
require 'uri'
require 'json'

def self.create_user(firstname, lastname, email)

	# User: Karl Erik: bcbc0d91-f231-4b45-90d4-af78122451a1

	uri = URI.parse("https://shared-sandbox-api.marqeta.com/v3/users")
	request = Net::HTTP::Post.new(uri)
	request.basic_auth("user5281481981491",
    "6f9acd4c-a6ac-4fe1-abc4-3e405003be5c")
	request.content_type = "application/json"

	request.body = JSON.dump({  
   		"active": "true",  
   		"first_name": firstname,
   		"last_name": lastname,
   		"email": email,
   		"uses_parent_account": "false" 
 	})

	req_options = {
  	use_ssl: uri.scheme == "https",
	}

	response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  	http.request(request)
	end

	puts(response.body)
	# response.code
	# response.body
end

def self.list_users

    # Shows data for chosen card

    # cid: existing card token

    uri = URI.parse("https://shared-sandbox-api.marqeta.com/v3/users")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth("user5281481981491",
      "6f9acd4c-a6ac-4fe1-abc4-3e405003be5c")
    request.content_type = "application/json"

    req_options = {
    use_ssl: uri.scheme == "https",
    }


    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
    end

    # debug only
    puts(response.body)

end
end

# Accounting.create_user('Mikk', 'Sillamaa', 'mikk.sillamaa@gmail.com1')
# Accounting.list_users