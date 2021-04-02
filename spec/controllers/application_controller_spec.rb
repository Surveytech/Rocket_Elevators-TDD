require 'rails_helper'
    
RSpec.describe "Session open", :type => :feature do
    #Test to check if the login is ok
    it "Test Login" do
        visit 'http://claudestlaurent.xyz/signin'

        fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
        expect(page).to have_text('INTERVENTIONS')
    end
end


RSpec.describe "test if we can access by url", :type => :routing do 
        it "must return to the home page" do
            expect(:get => "/admin").not_to be_routable
        end
end

