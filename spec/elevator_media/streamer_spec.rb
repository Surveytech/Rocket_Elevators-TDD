require 'elevator_media/streamer.rb'
# require 'rails_helper'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}
    # let!(:@options){ENV["OPEN_WEATHER_APPID"]}
    # let!(apikey = ENV["OPEN_WEATHER_APPID"])

    context 'Does getcontent method work' do

        it 'yes it works' do
            expect(streamer).to respond_to(:getcontent)
        end

    end

    context 'getcontent fonctionnality' do

        it "should call weather service by default" do
                expect(OpenWeather::Current).to receive(:city)
                streamer.getcontent
        end

        it "should not call weather service if another parameters is used" do
            expect(OpenWeather::Current).to_not receive(:city)
            streamer.getcontent('jokes')
        end

        it "should call weather service with weather param" do
            expect(OpenWeather::Current).to receive(:city)
            streamer.getcontent('weather')
            # p "----#{weathers}-----"
        end

    end

    context 'getweather' do

        it "Should create action # for weather service" do
            expect(OpenWeather::Current).to receive(:city).with("Berlin,DE",{:APPID=>"2fe833a897f6adda8d2270af6545a6ed", :units=>"metric"})
            streamer.getweather(@city)
        end    
        it "should return a human readable phrase" do
            expect(OpenWeather::Current).to_not receive(:city).with("Berlin,DE",{:APPID=>"2fe833a897f6adda8d2270af6545a6ed", :units=>"metric"})
            streamer.getweather(@city)
        end 
        it "should write testing 1-2" do
            expect(streamer.getcontent('weather')).not_to be_nil
        end  

    end

    context 'Does getweather work' do

        it 'yes getweather works great' do
            expect(streamer).to respond_to(:getweather)
        end

    end

    context 'Does getweather by city work' do

        it 'return city weather' do
            p "_________________WEATHER______________________"
            expect(streamer.getweather(@city)).not_to be_nil
            p "_________________WEATHER______________________"
        end

    end

end




# describe ElevatorMedia::Streamer do

#     let!(:streamer){ElevatorMedia::Streamer.new}

#     context 'Does getcontent method work' do                # try 1 doesn't work because there is no content in the method.
#         it 'yes it works' do                                # 2nd try add 55 in the method and 'yes it work' appear
#             expect(streamer).to respond_to(:getContent)
#         end
#     end

#     context 'Does getcontent return 55' do                # try 1 doesn't work because there is no content in the method.
#         it 'yes it return 55' do                          # 2nd try worked with number 58 and doesn't pass
#             puts(streamer.getContent(@input))             # 3rd try add 55 in the method and 'yes it work' appear
#             expect(streamer.getContent(@input)).to eq 55
#         end
#     end
#     context 'Does getweather work' do                       # try 1 doesn't work because the method wasn't write correctly.
#         it 'yes getweather works great' do                  # 2nd try worked with the methode weel written
#             expect(streamer).to respond_to(:getweather)
#         end
#     end

#     context 'Does getweather by city work' do                           # try 1 doesn't work because the method wasn't write correctly
#         it 'return city weather' do                                     # 2nd still doesn't, probably the variable? 
#             expect(streamer.getContent(@weather)).not_to be_nil      # 3rd, 4th and 5th didn't work
#         end                                                             # 6th time pass, create a var with the function and return it
#     end

#     context ''

# end