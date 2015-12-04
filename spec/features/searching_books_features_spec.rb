require 'rails_helper'

RSpec.feature "SearchingBooksFeatures", type: :feature do
  let!(:book) {Fabricate(:book, title: "Waiting for Test Action")}

  scenario "with existing title return searched books" do
  	visit root_path

  	fill_in "search_field", with: "Test"
  	click_button "Search Book"

  	expect(page).to have_content(book.title)
  	expect(current_path).to eq(search_catalogs_path)
  end
end
