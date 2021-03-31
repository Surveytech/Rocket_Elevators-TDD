require 'open_weather'


module ElevatorMedia

    class Streamer

        def initialize
            # apikey = ENV["OPEN_WEATHER_APPID"]
            @options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed"}
            @city = 'Yuzhnoukrainsk,UA'
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

        def method_name
        end
    end
end



# require 'open_weather'
# module ElevatorMedia

#     class Streamer

#         def initialize
#             @city = 'Quebec,CA'
#         end


#         def getContent(x)
#         #   @input = self.test55
#             if
#           @weather = self.getweather(@city)  
            
#         end

#         def getweather(city)
#             options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed" }
#             city_weather = OpenWeather::Current.city("#{city}", options)
#             puts(city_weather)
#             return city_weather
#         end

#         def test55
#             55
#         end
#     end
    
# end
# "The weather for #{city} is #{weather}."