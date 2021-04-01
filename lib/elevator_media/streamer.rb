require 'open_weather'
require 'uri'
require 'net/http'
require 'openssl'
require 'unirest'
require 'json'

module ElevatorMedia

    class Streamer

        def initialize
            @city = 'Berlin,DE'
            @stock = 'mdna'
        end

        def getcontent(content_type = 'weather')
            if content_type == 'weather'
                self.weatherapp(@city)
            end
        end

        def weatherapp(city)

            url = URI("https://community-open-weather-map.p.rapidapi.com/weather?q=#{@city}&lat=0&lon=0&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"]
            request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
            
            response = http.request(request)
            # puts JSON.parse(response.read_body)['shortName']
            # shortName = JSON.parse(response.read_body)['shortName']
            puts response.read_body
            return response.read_body
        end

        def stockquote(stock)
            url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=US&symbols=#{@stock}")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
            request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
            
            response = http.request(request)
            quoteResponse = JSON.parse(response.read_body)['quoteResponse']
            result = quoteResponse['result']
            @zero = result[0]
            puts @zero['symbol']

            return "<div class ='text-center'><h2>Symbol=</h2><p>#{@zero['symbol']}</p></div>"
        end
    end
end
