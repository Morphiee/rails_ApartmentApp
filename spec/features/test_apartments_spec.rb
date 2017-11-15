require 'rails_helper'

RSpec.feature "TestApartments", type: :feature do
    context "Apartments Page" do
        Steps "Going to Apartments page" do
            Given "I visit localhost:3000/apartments" do
                visit "/apartments"
            end
            Then "I see Apartments" do
                expect(page).to have_content("Apartments")
            end
        end
    end
    context "New Apartment Page" do
        Steps "Going to New Apartment page" do
            Given "I'm on the index page" do
                visit "/apartments"
            end
            When "I click the New Apartment link" do
                click_link 'New Apartment'
            end
            Then "I redirect to the new apartment page" do
                expect(page).to have_content("New Apartment")
            end
        end
        Steps "Creating a new apartment" do
            Given "I'm on the New Apartment page" do
                visit '/apartments/new'
                fill_in 'Address', with: '70 E J St'
                fill_in 'City', with: 'San Diego'
                fill_in 'State', with: 'CA'
                fill_in 'Country', with: 'United States'
                fill_in 'Postal', with: '91910'
                fill_in 'Building man', with: 'Bob'
                fill_in 'Phone', with: '6197772727'
                fill_in 'Hours', with: '9am - 5pm'
                attach_file('apartment[image]', '/Users/learn/desktop/coolguy.png')
            end
            When "I click the Create Apartmenet button" do
                click_button 'Create Apartment'
            end
            Then "Expect to redirect to the show page" do
                expect(page).to have_content("Apartment was successfully created.")
            end
            When "I click on the edit link." do
                click_link 'Edit'
            end
            Then "Expect to redirect to the edit page" do
                expect(page).to have_content("Editing Apartment")
            end
            When "I click on the back link" do
                click_link 'Back'
            end
            Then "Expect to redirect to the main apartments page" do
                expect(page).to have_content("Apartments")
            end
            When "I click the destroy link" do
                click_link 'Destroy'
            end
            Then "The page will tell me it has been destroyed" do
                expect(page).to have_content("Apartment was successfully destroyed.")
            end
        end
    end
end
