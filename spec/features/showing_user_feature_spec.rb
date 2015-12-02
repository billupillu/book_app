require 'rails_helper'
require 'support/macro'

	RSpec.feature 'Showing user profile' do

		let!(:admin) { Fabricate(:admin, username: "billupillu",email: 'billu@example.com') }
		before {sign_in_as admin}
		scenario do
			visit root_path
			click_link 'Users'
			print page.html
			click_link admin.email

			within("h2.titles") do
				expect(page).to have_content('billupillu')
			end
			within("#email") do
				expect(page).to have_content('billu@example.com')
			end

		end

	end