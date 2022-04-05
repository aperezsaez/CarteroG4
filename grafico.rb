require "uri"
require "net/http"
require "json"

def request(url)
    url = URI(url)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    
    response = https.request(request)
    JSON.parse(response.read_body)
end

data = request("https://api.coindesk.com/v1/bpi/historical/close.json")
selected_data = data["bpi"].select do |key, value|
    value < 40000
end

print selected_data.keys