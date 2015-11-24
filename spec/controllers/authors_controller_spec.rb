require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe "GET #index" do
    it "returns a sucessfull http success code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns sucessfull http status code for show" do
      author = Fabricate(:author)
      #require "pry";binding.pry
      get :show, id: author.id
      expect(response).to have_http_status(:success)
    end
  end
end
