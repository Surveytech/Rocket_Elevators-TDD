require 'rails_helper'
require './app/controllers/leads_controller.rb'

describe "Testing leads creation", type: :controller do
    
    lead  = Lead.new()

    lead.full_name = "Claude St-Laurent"
    lead.email = "csl.codeboxx@gmail.com"
    lead.phone = "418-418-4180"
    lead.company_name = "Codeboxx"
    lead.project_name = "Bad Moth Fu"
    lead.department = "Dont care"
    lead.project_description = "need to replace my elevator"
    lead.message = "need to go down faster then that"

    context "test the leads form" do
        it "check to see if it's in the leads form" do
            expect(lead).to be_a(Lead)
        end
    end

    context "test if the full name is there" do
        it "the full name is enter" do
            expect(lead.full_name).to be_instance_of(String)
        end
    end

    context "test to see if the departement is sales" do
        it "check the departement" do
            expect(lead.department).to be_instance_of(String)
        end
    end
end