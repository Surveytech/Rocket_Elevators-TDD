require 'open_weather'
require 'uri'
require 'net/http'
require 'openssl'


module ElevatorMedia

    class Streamer

        def initialize
            # apikey = ENV["OPEN_WEATHER_APPID"]
            @options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed"}
            @city = 'Berlin,DE'
            @stock = 'AAPL'
        end

        def getcontent(content_type='weather')
            #$input = 55
            if content_type == 'weather'
                self.getweather(@city)
            end
        end

        def getweather(city)
            # options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed"}
            @weathers = OpenWeather::Current.city("#{@city}", @options)
            puts(@weathers)
            return @weathers
        end

        def stockquote(stock)
            # url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=US&symbols=#{@stock}")

            # http = Net::HTTP.new(url.host, url.port)
            # http.use_ssl = true
            # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            
            # request = Net::HTTP::Get.new(url)
            # request["x-rapidapi-key"] = '2975dee3a1msh00aeed5496d9f26p1931c8jsn14ec53fcd3aa'
            # request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'
            
            # response = http.request(request)
            # puts response.read_body
            # return response
        end
    end
end
