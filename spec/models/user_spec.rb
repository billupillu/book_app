require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a username" do
  	user = Fabricate.build(:user, username: nil)
  	expect(user).not_to be_valid
  	expect(user.errors[:username].any?).to be_truthy
  end	
  it "should have an email"do
  	user = Fabricate.build(:user, email: nil)
  	expect(user).not_to be_valid
  	expect(user.errors[:email].any?).to be_truthy
  end	
  it "should have a password"do
  	user = Fabricate.build(:user, password: nil)
  	expect(user).not_to be_valid
  	expect(user.errors[:password].any?).to be_truthy
  end	
end
