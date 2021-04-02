require 'rails_helper'
# require './app/views/devise/sessions/new.html.erb'

describe ApplicationController, :type => :request do
    
    describe "Session open", :type => :feature do
        #Test to check if the login is ok
        it "Test Login" do
            visit 'http://claudestlaurent.xyz/signin'

            fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
            fill_in 'Password', with: '123456'
            click_button 'Log in'
            expect(page).to have_text('INTERVENTIONS')
        end

        # it "Test try out with url" do
        #     visit 'http://claudestlaurent.xyz/admin'
        #     expect(page).to eq('http://claudestlaurent.xyz')
        # end
    end
end

