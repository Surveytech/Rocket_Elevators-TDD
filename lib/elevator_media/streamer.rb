require 'open_weather'
module ElevatorMedia

    class Streamer
        def convert(n)
            '1'
        end  
        
        def getcontent(input)
            55
        end

        def getweather(city)
            options = { units: "metric", APPID: "2fe833a897f6adda8d2270af6545a6ed" }
            OpenWeather::Current.city("#{city}", options)
        end
    end
    
end