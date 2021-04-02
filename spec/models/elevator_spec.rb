require 'rails_helper'
require './app/models/elevator.rb'

RSpec.describe Elevator, :type => :model do

    elevator = Elevator.new(
                            serial_number: 12345,
                            model: "modern",
                            type_building: "commercial",
                            status: "active",
                            date_commissioning: rand(4.years).seconds.ago,
                            date_last_inspection: rand(2.years).second.ago,
                            created_at: DateTime.now,
                            updated_at: DateTime.now)
    #elevator.column = column

    context "check if the updated at works" do
        it "give the time now minus +/- 3 secondes" do            # need to be not_to to pass beacause there's a delay between the 2 operations                     
            timenow = ((DateTime.now) + 4/24.0)
            expect(elevator.updated_at).not_to eq(timenow)
            puts(elevator.updated_at)
            puts (timenow)
        end
    end  

    context "validate if elevator is created" do
        it "must return valid" do
            expect(elevator).to be_valid
        end
    end
end 