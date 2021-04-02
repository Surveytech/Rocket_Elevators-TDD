require 'rails_helper'
require './app/controllers/leads_controller.rb'

describe "Testing leads creation", type: :controller do
    
    # creation of the lead form
    lead  = Lead.new()

    lead.full_name = nil
    lead.email = "csl.codeboxx@gmail.com"
    lead.phone = "418-418-4180"
    lead.company_name = "Codeboxx"
    lead.project_name = "Bad Moth Fu"
    lead.department = "Dont care"
    lead.project_description = "need to replace my elevator"
    lead.message = "need to go down faster then that"

    # to test if the lead form is created
    context "test the leads form" do                    
        it "check to see if it's in the leads form" do
            expect(lead).to be_a(Lead)
        end
    end
    # to test if the full name is there
    context "test if the full name is there" do             # test 1 didn't  pass because the full name is Nil
        it "the full name is enter" do                      # test 2 pass when Grand Schtroumpf was pass as full name
            lead.full_name = "Grand Schtroupf"
            expect(lead.full_name).to be_kind_of(String)
        end
    end

end