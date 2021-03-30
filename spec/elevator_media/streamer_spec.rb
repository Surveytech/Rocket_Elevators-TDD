require 'elevator_media/streamer.rb'
# require 'rails_helper'


describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'Does getcontent method work' do                # try 1 doesn't work because there is no content in the method.
        it 'yes it works' do                                # 2nd try add 55 in the method and 'yes it work' appear
            expect(streamer).to respond_to(:getContent)
        end
    end

    context 'Does getcontent return 55' do                # try 1 doesn't work because there is no content in the method.
        it 'yes it return 55' do                          # 2nd try worked with number 58 and doesn't pass
            puts(streamer.getContent(@input))             # 3rd try add 55 in the method and 'yes it work' appear
            expect(streamer.getContent(@input)).to eq 55
        end
    end

    context 'Does getweather work' do                       # try 1 doesn't work because the method wasn't write correctly.
        it 'yes getweather works great' do                  # 2nd try worked with the methode weel written
            expect(streamer).to respond_to(:getweather)
        end
    end

    context 'Does getweather by city work' do                           # try 1 doesn't work because the method wasn't write correctly
        it 'return city weather' do                                     # 2nd still doesn't, probably the variable? 
            expect(streamer.getContent(@weather)).not_to be_nil      # 3rd, 4th and 5th didn't work
        end                                                             # 6th time pass, create a var with the function and return it
    end

    context ''

end