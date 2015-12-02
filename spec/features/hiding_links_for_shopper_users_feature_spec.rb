require 'rails_helper'
require 'support/macro'

RSpec.feature "HidingLinksForShopperUsers", type: :feature do
		let(:user) {Fabricate(:user)}
		scenario "for shopper users hiding links" do
			sign_in_as user

			visit root_path
			expect(page).not_to have_link("Users")
		end
end
