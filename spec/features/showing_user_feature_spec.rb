require 'rails_helper'

	RSpec.feature 'Showing user profile' do

		let!(:user) { Fabricate(:user, username: "billupillu",email: 'billu@example.com') }
		scenario do
			visit root_path
			click_link 'Users'
			print page.html
			click_link user.email

			within("h2.titles") do
				expect(page).to have_content('billupillu')
			end
			within("#email") do
				expect(page).to have_content('billu@example.com')
			end

		end

	end