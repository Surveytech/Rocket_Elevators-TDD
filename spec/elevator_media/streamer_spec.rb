require 'elevator_media/streamer.rb'
require 'rails_helper'

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
                expect(streamer.getcontent).to receive(:city)
                streamer.getcontent
        end

        it "should not call weather service if another parameters is used" do
            expect(streamer.getcontent).to_not receive(:city)
            streamer.getcontent('jokes')
        end

        it "should call weather service with weather param" do
            expect(streamer.getcontent).to receive(:city)
            streamer.getcontent('weather')
            # p "----#{weathers}-----"
        end

    end

    context 'Does getweather work' do

        it 'yes getweather works great' do
            expect(streamer).to respond_to(:getweather)
        end
    end

    context 'getweather' do

        it "Should create action # for weather service" do
            expect(OpenWeather::Current).to receive(:city).with("Berlin,DE",{:APPID=> ENV["OPEN_WEATHER_APPID"], :units=>"metric"})
            streamer.getweather(@city)
        end    
        it "should return a human readable phrase" do
            expect(OpenWeather::Current).to_not receive(:city).with("Berlin,DE",{:APPID=> ENV["OPEN_WEATHER_APPID"], :units=>"metric"})
            streamer.getweather(@city)
        end 
        it "should write testing 1-2" do
            expect(streamer.getcontent('weather')).not_to be_nil
        end  
    end

    context 'Does getweather by city work' do

        it 'return city weather' do
            p "_________________WEATHER______________________"
            expect(streamer.getweather(@city)).not_to be_nil
            p "_________________WEATHER______________________"
        end
    end

    context 'Does stockquote work' do

        it 'yes stockquote works' do
            expect(streamer).to respond_to(:stockquote)
        end

        it 'return AAPL infos' do                           #1 didn't pass
            expect(streamer.stockquote(@stock)).not_to be_nil     #2 didn't pass no argument
        end     
        it 'is it in a div' do
            expect(streamer.stockquote(@stock)).to include("div")
        end                                                  #3 didin't pass, puts quote but no return 
    end                                                           #4 pass, added return response to the method  

end
