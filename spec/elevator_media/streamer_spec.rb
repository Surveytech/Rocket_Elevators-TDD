require 'elevator_media/streamer.rb'
# require 'rails_helper'

# describe ElevatorMedia::Streamer do                           # this try didn't work
#     let!(:streamer){ElevatorMedia::Streamer.new}

#     context 'what should I have receive?' do
#         it 'should return "1" when receives 1' do
#             expect(streamer.convert(1)).to '1'
#         end
#     end
# end

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'what should I have receive?' do
        it 'should return "1" when receives 1' do
            expect(streamer.convert(1)).to eq '1'
        end
    end

    context 'Does getcontent method work' do                # try 1 doesn't work because there is no content in the method.
        it 'yes it works' do                                # 2nd try add 55 in the method and 'yes it work' appear
            expect(streamer).to respond_to(:getcontent)
        end
    end

    context 'Does getweather work' do                       # try 1 doesn't work because the method wasn't write correctly.
        it 'yes getweather works great' do                  # 2nd try worked with the methode weel written
            expect(streamer).to respond_to(:getweather)
        end
    end

    context 'Does getweather by city work' do               
        it 'return city weather' do
            expect(streamer.getweather('Cobber Pedy')).not_to be_nil
        end
    end

end