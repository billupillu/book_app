require "rails_helper"

RSpec.feature "Creating Author" do
  scenario "with valid input succeed" do
    visit root_path
    click_link "Authors"
    click_link "Add New Author"
    fill_in "firstName", with: "Bill"
    fill_in "secondName", with: "Gates"
    click_button "Create Author"
    expect(page).to have_content("Author has been successfully created")
  end
  # in case of invalid inputs or unsuccessful creation
  scenario "with invalid input and failing" do
    visit root_path
    click_link "Authors"
    click_link "Add New Author"
    fill_in "firstName", with: ""
    fill_in "secondName", with: ""
    click_button "Create Author"
    expect(page).to have_content("Author has not been created")
  end
end
