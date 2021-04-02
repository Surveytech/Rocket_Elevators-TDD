require 'rails_helper'
    
RSpec.describe "Session open", :type => :feature do

    #Test to check if the login is working
    it "Test Login" do
        visit '/signin'

        fill_in 'Email', with: 'admin@admin.com'        
        fill_in 'Password', with: '123456'
        click_button 'Log in'
        expect(page).to have_text('INTERVENTIONS')
    end
end

# direct route to the admin page isn't suppose to exist
RSpec.describe "test if we can access admin by url", :type => :routing do 
        it "must return to the home page" do
            expect(:get => "/admin").not_to be_routable
        end
end
# check if the route to interventions exist
RSpec.describe "test if the interventions route is good", :type => :routing do  # fails first time because interventions was accessible directly by url
    it "must go to interventions index " do
        expect(:get => "/interventions").to route_to('interventions#index')
    end
end
