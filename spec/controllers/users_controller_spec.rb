require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
    it "returns a successful http request status code" do
      user = Fabricate(:user)
      get :show, id: user
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  #==== POST =======
  describe "POST #create" do
    context "a successful create" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end
      it "saves the new user object" do
        expect(User.count).to eq(1)
      end
      it "redirects to the show action" do
        expect(response).to redirect_to user_path(User.first)
      end
      it "sets the success flash message" do
        expect(flash[:success]).to eq('User has been created')
      end
    end

    context "unsuccessful create" do
      before do
	       post :create, user: Fabricate.attributes_for(:user, username: nil)
	      end
	      it "it does not save the new user object with invalid inputs" do
	        expect(User.count).to eq(0)
	      end
	      it "renders the new template" do
	       expect(response).to render_template :new
	      end
	      it "sets the failure flash message" do
	       expect(flash[:danger]).to eq('User has not been created')
	      end
    	end
  	end

  	#========= DELETE==========
	describe 'DELETE #destroy' do
	  let(:user) { Fabricate(:user) }

	    before do
	      delete :destroy, id: user
	    end
	    it 'deletes the user with the given id' do
	     expect(User.count).to eq(0)
	    end
	    it 'sets the flash message' do
	      expect(flash[:success]).to eq('User has been deleted')
	    end
	    it 'redirects to the index page' do
	      expect(response).to redirect_to root_path
	    end
	  end

end
