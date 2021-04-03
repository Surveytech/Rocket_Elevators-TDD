require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'weatherapp' do

        it 'Does weatherapp exist' do
            expect(streamer).to respond_to(:weatherapp)
        end

        it 'return Berlin infos if @city = Berlin' do                   #1 didn't pass because the city wasn't Berlin
            expect(streamer.getcontent('city')).to include("Berlin")     #2 pass beacause de city was changed to Berlin,DE
        end                                                             
    end

    context 'stockquote tests' do

        it 'return stock symbol' do                                 #1 didn't pass
            expect(streamer.getcontent('stock')).not_to be_nil       #2 didn't pass no argument
        end     
        it 'is it in a div' do                                      #3 didin't pass, puts quote but no return 
            expect(streamer.getcontent('stock')).to include("div")   #4 pass, added return response to the method
        end                                                  
    end                                                             

end
