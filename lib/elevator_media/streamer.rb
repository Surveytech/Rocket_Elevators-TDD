require 'open_weather'
require 'uri'
require 'net/http'
require 'openssl'
require 'unirest'
require 'json'

module ElevatorMedia

    class Streamer

        def initialize
            # apikey = ENV["OPEN_WEATHER_APPID"]
            @options = { units: "metric", APPID: ENV["OPEN_WEATHER_APPID"]}
            @city = 'Berlin,DE'
            @stock = 'AAPL'
        end

        def getcontent(content_type='weather')
            if content_type == 'weather'
                self.weatherapp(@city)
            end
        end

        def weatherapp(city)

            url = URI("https://community-open-weather-map.p.rapidapi.com/weather?q=London%2Cuk&lat=0&lon=0&callback=test&id=2172797&lang=null&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"]
            request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
            
            response = http.request(request)
            puts JSON.parse(response.read_body)['shortName']
            shortName = JSON.parse(response.read_body)['shortName']
            return shortName
        end

        def getweather(city)
            # options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed"}
            @weathers = OpenWeather::Current.city("#{@city}", @options)
            puts(@weathers)
            return "div class='text-center'><h2> @weathers </h2><p>#{@weathers}</p></div>"
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
            # puts JSON.parse(response.read_body)['quoteResponse']
            quoteResponse = JSON.parse(response.read_body)['quoteResponse']
            result = quoteResponse['result']
            @zero = result[0]
            puts @zero['symbol']

            return "<div class ='text-center'><h2>Symbol=</h2><p>#{@zero['symbol']}</p></div>"
        end
    end
end
