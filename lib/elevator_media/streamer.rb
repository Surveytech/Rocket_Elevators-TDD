require 'open_weather'
module ElevatorMedia

    class Streamer

        def initialize
            @city = 'Quebec,CA'
        end


        def getContent(x)
        #   @input = self.test55
          @weather = self.getweather(@city)  
            
        end

        def getweather(city)
            options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed" }
            city_weather = OpenWeather::Current.city("#{city}", options)
            puts(city_weather)
            return city_weather
        end

        def test55
            55
        end
    end
    
end
# "The weather for #{city} is #{weather}."