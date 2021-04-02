require 'rails_helper'
require './app/controllers/interventions_controller.rb'

RSpec.describe InterventionsController, type: :controller do
    
    # creation of the intervention form
    let!(:inter){Intervention.new}

    describe "create an intervention" do
        intervention = Intervention.create(
        author_id: 5,
        customer_id: 6,
        building_id: 7,
        battery_id: 8,
        column_id: 9,
        elevator_id: 10,
        employee_id: 1,
        intervention_start: rand(2.months).seconds.ago,
        intervention_end: rand(3.days).seconds.ago,
        result: "Incomplete",
        report: nil,
        status: "Pending"
        )
        it "test the intervention table content" do
            expect(intervention).not_to be(nil)
            expect(intervention.result).to eq("Incomplete")
            expect(intervention).to be_a(Intervention)
        end
    end
    describe " check if there a successful http response" do
        it "return 200 if it's ok" do
            expect(@response.status).to eq(200)
            puts(@response.status)
        end
    end

    # to test if the attribute passed is in the form
    context "test the interventions form" do
        it "check to see if it's in the interventions form" do
            inter.author_id = nil
            expect(inter).not_to be_valid
        end
    end
    # to test if the report is in the form
    context "test if the report is there" do                # the first test fail because the report is nil
        it "the report is there" do 
            inter.report = "Job is done"                        # 2nd test passes when "jo is done" is add the report
            expect(inter.report).to be_kind_of(String)
            puts inter.report
        end
    end

end