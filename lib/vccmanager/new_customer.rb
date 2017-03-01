
require 'net/http'
require 'uri'
require 'json'

#User: Karl Erik: bcbc0d91-f231-4b45-90d4-af78122451a1

uri = URI.parse("https://shared-sandbox-api.marqeta.com/v3/users")
request = Net::HTTP::Post.new(uri)
request.basic_auth("user5281481981491", "6f9acd4c-a6ac-4fe1-abc4-3e405003be5c")
request.content_type = "application/json"

request.body = JSON.dump({  
   "active": true,  
   "first_name": "Karl Erik",
   "last_name": "Õunapuu",
   "email": "pless",
   "uses_parent_account": false 
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