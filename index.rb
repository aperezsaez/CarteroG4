require "uri"
require "net/http"
require "json"

def request(url)
    url = URI(url)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    results = JSON.parse(response.read_body)
end
# limitamos la respuesta a 10 registros
data = request("https://jsonplaceholder.typicode.com/photos")[0..9]
# recorremos la respuesta y obetnemos las "thumbnailUrl"
photos = data.map do |photo|
    photo["thumbnailUrl"]
end

html = ""
photos.each do |photo|
    html += "<img src='#{photo}'>\n"
end

File.write('index.html', html)