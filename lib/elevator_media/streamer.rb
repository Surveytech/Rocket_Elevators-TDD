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

        def getcontent(content_type)
            if content_type == 'city'
                self.weatherapp(@city)
            else
                self.stockquote(@stock)
            end
        end
            # Open weather API with RapidApi
        def weatherapp(city)

            url = URI("https://community-open-weather-map.p.rapidapi.com/weather?q=#{@city}&lat=0&lon=0&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"]
            request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
            
            response = http.request(request)
            temp = (response.read_body)['test']
            # puts JSON.parse(response.read_body)['tempmin']
            # puts JSON.parse(response.read_body)['temp_max']

            puts response.read_body['coord']
            return response.read_body
        end
            # Yahoo Finance API with RapidApi
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
            puts "Symbol = #{@zero['symbol']}, Exchange = #{@zero['fullExchangeName']}, Bid = #{@zero['bid']}, Ask = #{@zero['ask']}"

            return "<div class =col>
                        <h2>Symbol=<a>#{@zero['symbol']}</a></h2>
                        <h4>Exchange=<a>#{@zero['fullExchangeName']}</a></h4>
                        <h4>Bid=<a>#{@zero['bid']}</a></h4>
                        <h4>Ask=<a>#{@zero['ask']}</a></h4>
                    </div>"
        end
    end
end
