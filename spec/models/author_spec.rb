require 'rails_helper'

RSpec.describe Author, type: :model do

  it "should have a first_name" do
    author = Fabricate.build(:author, first_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_truthy
  end

  it "should have a second_name" do
    author = Fabricate.build(:author, second_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:second_name]).to include("can't be blank")
  end

  describe "#full_name" do
    it "returns a full_name" do
      author = Fabricate(:author)
      #require "pry";binding.pry
      expect(author.full_name).to eq("#{author.first_name } #{author.second_name}")
    end
  end

end
