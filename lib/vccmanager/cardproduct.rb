
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse("https://shared-sandbox-api.marqeta.com/v3/cardproducts")
request = Net::HTTP::Post.new(uri)
request.basic_auth("user5281481981491", "6f9acd4c-a6ac-4fe1-abc4-3e405003be5c")
request.content_type = "application/json"
#request.body = JSON.dump({
#  "first_name" => "Karl Erik",
#  "last_name" => "Õunapuu",
#  "active" => true
#})
request.body = JSON.dump({
    	'start_date' => '2017-02-16',
    	'name' => 'Card Product',
    	'active' => 'true',
    	'config' => {
    		'poi' => {
    			'other' => {
    				'allow' => 'true'
    			},
    			'ecommerce' => 'true'
    		},
    		'transaction_controls' => {
    			'allow_gpa_auth' => 'true',
    			'disable_avs' => 'true'
    		},
    		'card_life_cycle' => {
    			'activate_upon_issue' => 'true'
    		},
    		}
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