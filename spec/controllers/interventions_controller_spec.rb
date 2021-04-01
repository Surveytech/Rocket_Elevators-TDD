require 'rails_helper'
require './app/controllers/interventions_controller.rb'

describe "Testing interventions creation", type: :controller do
    
    intervention  = Intervention.new()

    intervention.author_id = 5
    intervention.customer_id = 6
    intervention.building_id = 7
    intervention.battery_id = 8
    intervention.column_id = 9
    intervention.elevator_id = 10
    intervention.employee_id = 1
    intervention.report = "Job is done"

    context "test the interventions form" do
        it "check to see if it's in the interventions form" do
            expect(intervention).to be_a(Intervention)
        end
    end

    context "test if the report is there" do
        it "the report is there" do
            expect(intervention.report).to be_instance_of(String)
        end
    end

    context "test to see if the departement is sales" do
        it "check the departement" do
            expect(intervention.column_id).to be_instance_of(Integer)
        end
    end
end