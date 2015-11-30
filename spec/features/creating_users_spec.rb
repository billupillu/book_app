require 'rails_helper'

RSpec.feature "CreatingUsers", type: :feature do
  
	scenario "with valid input succeeds" do
		visit root_path

		click_link "Sign Up"

		fill_in "userUsername", with: "#{Faker::Internet.user_name}"
		fill_in "userEmail", with: "#{Faker::Internet.email}"
		fill_in "userPassword", with: "passwordsecure"
		fill_in "userPasswordConfirmation", with: "passwordsecure"

		click_button "Create User"

		expect(page).to have_content("User has been created")
	end

	scenario "with invalid input fails" do
		visit root_path

		click_link "Sign Up"

		fill_in "userUsername", with: ""
		fill_in "userEmail", with: "#{Faker::Internet.email}"
		fill_in "userPassword", with: "passwordsecure"
		fill_in "userPasswordConfirmation", with: "passwordsecure"

		click_button "Create User"

		expect(page).to have_content("User has not been created")
	end

end


