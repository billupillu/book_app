require 'rails_helper'
require 'support/macro'

RSpec.feature "UserSignoutFeatures", type: :feature do
  let(:user) {Fabricate(:user)}
  before {sign_in_as user}
  scenario "sign out" do
	  visit root_path
	  click_link "Sign Out"
	  expect(page).to have_content("Successfuly Signed Out")
	  expect(current_path).to eq(root_path)
	end 
end
