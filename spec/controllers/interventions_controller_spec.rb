require 'rails_helper'
require './app/controllers/interventions_controller.rb'

RSpec.describe InterventionsController, type: :controller do
    
    # creation of the intervention form
    intervention  = Intervention.new()

    intervention.author_id = 5
    intervention.customer_id = 6
    intervention.building_id = 7
    intervention.battery_id = 8
    intervention.column_id = 9
    intervention.elevator_id = 10
    intervention.employee_id = 1
    intervention.report = nil

    # to test if the attribute passed is in the form
    context "test the interventions form" do
        it "check to see if it's in the interventions form" do
            intervention.author_id = nil
            expect(intervention).not_to be_valid
        end
    end
    # to test if the report is in the form
    context "test if the report is there" do                # the first test fail because the report is nil
        it "the report is there" do 
            intervention.report = "Job is done"                        # 2nd test passes when "jo is done" is add the report
            expect(intervention.report).to be_kind_of(String)
            puts intervention.report
        end
    end

end