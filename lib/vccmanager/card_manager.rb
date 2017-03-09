class CardManager
  require 'net/http'
  require 'uri'
  require 'json'

  def self.generate_vcc(uid, pid)
    # Generates new Virtual Credit Card for provided user

    # uid: user token
    # pid: card product token

    uri = URI.parse('https://shared-sandbox-api.marqeta.com/v3/cards?show_cvv_number=true&show_pan=true')
    request = Net::HTTP::Post.new(uri)
    request.basic_auth('user5281481981491',
                       '6f9acd4c-a6ac-4fe1-abc4-3e405003be5c')
    request.content_type = 'application/json'

    request.body = JSON.dump(
      'user_token' => uid,
      'card_product_token' => pid
    )

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    puts(response.body)

    data = JSON.parse(response.body)
    puts '---------------------'
    card_number = data.fetch('pan')
    card_expiry = data.fetch('expiration')
    card_vcc = data.fetch('cvv_number')
    card_status = data.fetch('state') + ' (' + data.fetch('state_reason') + ')'

    puts "Card number: #{card_number}"
    puts "Expiry: #{card_expiry}"
    puts "VCC code: #{card_vcc}"
    puts "Card status: #{card_status}"
  end

  def self.list_vcc(uid)
    # Lists all generated virtual credit cards for given user

    # uid: user token

    uri = URI.parse('https://shared-sandbox-api.marqeta.com/v3/cards/user/' +
    uid)
    request = Net::HTTP::Get.new(uri)
    request.basic_auth('user5281481981491',
                       '6f9acd4c-a6ac-4fe1-abc4-3e405003be5c')
    request.content_type = 'application/json'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # debug only
    # puts(response.body)

    @cards = JSON.parse(response.body)['data']

    # Let's fetch data for each VCC generated for user

    @cards.each do |item|
      card_token = item.fetch('token')
      card_number = item.fetch('pan')
      card_expiry = item.fetch('expiration')
      card_expiry_time = item.fetch('expiration_time')
      card_status = item.fetch('state')

      puts '---------------------'
      puts "Card token: #{card_token}"
      puts "Card number: #{card_number}"
      puts "Expiry: #{card_expiry}"
      puts "Exact expiration time: #{card_expiry_time}"
      puts "Card status: #{card_status}"
      puts '---------------------'
    end
  end

  def self.view_vcc(cid)
    # Shows data for chosen card

    # cid: existing card token

    uri = URI.parse('https://shared-sandbox-api.marqeta.com/v3/cards/' + cid +
      '/showpan?show_cvv_number=true')
    request = Net::HTTP::Get.new(uri)
    request.basic_auth('user5281481981491',
                       '6f9acd4c-a6ac-4fe1-abc4-3e405003be5c')
    request.content_type = 'application/json'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # debug only
    puts(response.body)

    data = JSON.parse(response.body)
    card_number = data.fetch('pan')
    card_expiry = data.fetch('expiration')
    card_vcc = data.fetch('cvv_number')
    card_status = data.fetch('state')

    puts '---------------------'
    puts "Card number: #{card_number}"
    puts "Expiry: #{card_expiry}"
    puts "VCC code: #{card_vcc}"
    puts "Card status: #{card_status}"
    puts '---------------------'
  end
end
# CardManager.generate_vcc('72178c75-87a8-4ec9-b82a-390582be0173', '7a5eb9a1-ae55-4f88-8791-aa254130c808')
# Cardmanager.list_vcc('72178c75-87a8-4ec9-b82a-390582be0173')
# CardManager.view_vcc('de6bc4f1-9149-4c01-80ef-e2d5594f15e5')
