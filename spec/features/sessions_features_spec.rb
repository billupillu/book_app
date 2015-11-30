require 'rails_helper'

RSpec.feature "SessionsFeatures", type: :feature do
	let!(:user) {Fabricate(:user, email: "test@example.com")}

	scenario "successful sign in" do

		visit root_path
		click_link "Sign In"
		expect(page).to have_link("Sign Up")
		
		fill_in "sessionEmail", with: "#{user.email}"
		fill_in "sessionPassword", with: "#{user.password}"
		click_button "Sign In"
		expect(page).to have_content("Successfuly Signed in")
	end


	scenario "un-successful sign in" do
		
		visit root_path
        click_link "Sign In"
        expect(page).to have_link("Sign Up")

        fill_in "sessionEmail", with: "#{user.email}"
        fill_in "sessionPassword", with: "wrongpassword"
        click_button "Sign In"
        expect(page).to have_content("Invalid combination of email and password")

	end 

	
end
