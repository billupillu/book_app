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

  describe "GET #new" do
    it "returns sucessfull http status code for new action" do
        get :new
        expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful save" do
      it "creates new author in DB" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(Author.count).to eq(1)
      end
      it "successfuly redirect to show template" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(response).to redirect_to(author_path(Author.last))
      end
      it "display success flash message" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(flash[:success]).to eq("Author has been successfully created")
      end
    end

    context "a unsuccessful save" do
      it "does not creates new author in DB" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(Author.count).to eq(0)
      end
      it "display success flash message" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(flash[:danger]).to eq("Author has not been created")
      end
    end
  end

  describe "GET #edit" do
    it "successfully renders the edit template" do
      author = Fabricate(:author)
      get :edit, id: author.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "Successful Update" do
      let(:author) {Fabricate(:author, first_name: "Chill")}

      it "to successfuly update the author" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Bill"), id: author.id
        expect(Author.last.first_name).to eq("Bill")
        expect(Author.last.first_name).not_to eq("Chill")
      end
      it "displays success flash" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Bill"), id: author.id
        expect(flash[:success]).to eq("Author has been successfuly Updated")
      end
      it "redirects to show" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Bill"), id: author.id
        expect(response).to redirect_to(author_path(Author.last))
      end
    end

    context "Unsuccessful Update" do
      let(:author) {Fabricate(:author, first_name: "Bill")}

      it "does not update author for invalid input" do
        put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: author.id
        expect(Author.last.first_name).to eq("Bill")
      end
      it "displays danger flash" do
        put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: author.id
        expect(flash[:danger]).to eq("Author has not been Updated")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:author) {Fabricate(:author)}

    it "successfuly deletes the author" do
      delete :destroy, id: author.id
      expect(Author.count).to eq(0)
    end
    it "display success flash for deletion" do
      delete :destroy, id: author.id
      expect(flash[:success]).to eq("Author has been successfuly Deleted")
    end
    it "redirects to index action" do
      delete :destroy, id: author.id
      expect(response).to redirect_to(authors_path)
    end
  end
end
