require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'Does weatherapp work' do

        it 'yes weatherapp works great' do
            expect(streamer).to respond_to(:weatherapp)
        end
    end

    context 'weatherapp' do

        it "should write testing 1-2" do
            expect(streamer.getcontent('weather')).not_to be_nil
        end 
        it 'return Berlin infos if @city = Berlin' do                           #1 didn't pass
            expect(streamer.weatherapp(@city)).to include("Berlin")     #2 didn't pass no argument
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
