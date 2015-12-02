require "rails_helper"
require "support/macro"

RSpec.feature "Creating Author" do

	let!(:oriely) {Fabricate(:publisher, name: "ORiely Press")}
	let!(:author1) {Fabricate(:author)}
	let!(:author2) {Fabricate(:author)}

	let(:admin) {Fabricate(:admin)}
  	before {sign_in_as admin}

	scenario "with valid input succeeds" do
		visit root_path
		click_link "Books", exact: true
		click_link "Add New Book"

		#filling the Book form
		fill_in "bookTitle", with: "Javascript"
		fill_in "bookIsbn", with: "1"*13
		fill_in "bookPage_count", with: 355
		fill_in "bookPrice", with: 34.99
		fill_in "bookDescription", with: "#{Faker::Lorem.paragraph}"
		fill_in "bookPublished_at", with: "2012-01-01"
		#from the combo box
		select "ORiely Press", from: "Publisher"
		select author1.full_name, from: "chosen_select" 
		select author2.full_name, from: "chosen_select"

		#upload a file

		attach_file "book_cover", "app/assets/images/test_book.jpg"

		click_button "Create Book"

		expect(page).to have_content("Book has been created") 
	end
end