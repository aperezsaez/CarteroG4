require "uri"
require "net/http"
require "json"

def request(url)
    url = URI(url)

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)
    
    response = http.request(request)
    results = JSON.parse(response.read_body)
end
puts request("http://jsonplaceholder.typicode.com/photos")
#puts results.class
#puts results[0]
# puts results[0]["title"]
