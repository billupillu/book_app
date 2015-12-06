require 'rails_helper'

RSpec.describe Address, type: :model do
  it "requires addres line 1" do
  	address = Fabricate.build(:address, addres_line1: nil)

  	expect(address).not_to be_valid
  	expect(address.errors[:addres_line1].any?).to be_truthy
  end

  it "requires city" do
  	address = Fabricate.build(:address, city: nil)

  	expect(address).not_to be_valid
  	expect(address.errors[:city].any?).to be_truthy
  end

  it "requires state" do
  	address = Fabricate.build(:address, state: nil)

  	expect(address).not_to be_valid
  	expect(address.errors[:state].any?).to be_truthy
  end

  it "requires zipcode" do
  	address = Fabricate.build(:address, zipcode: nil)

  	expect(address).not_to be_valid
  	expect(address.errors[:zipcode].any?).to be_truthy
  end

  it {should belong_to(:user)}
end
