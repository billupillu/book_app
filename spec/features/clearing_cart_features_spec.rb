require 'rails_helper'

RSpec.feature "ClearingCartFeatures", type: :feature do
	let!(:railsWay) {Fabricate(:book, title: "Rails 4 Way")}

	scenario "clear contents of cart" do
		visit root_path
		
		expect(page).to have_content(railsWay.title)
		
		visit "/catalogs/#{railsWay.id}"
		click_button "Add To Cart"
		expect(page).to have_button("Clear Cart")
		click_button "Clear Cart"
		expect(current_path).to eq(catalogs_path)
	end
end
