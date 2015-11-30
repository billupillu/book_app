require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	let(:user) {Fabricate(:user)}
	
	describe "GET #new" do
		
		context "Un-authenticated Users" do
			it "returns a successful HTTP status" do
				get :new
				expect(response).to have_http_status(:success)
			end
		end

		context "Authenticated Users" do
			it "redirects to root path" do
				session[:user_id] = user.id
				get :new
				expect(response).to redirect_to(root_path)
			end
		end
	end

	
	describe "POST #create" do
	
		context "successful Sign-In" do
			before do
				post :create, {email: user.email, password: user.password}
			end
			
			it "redirects to root path" do
				expect(response).to redirect_to root_path
			end
			it "sets a success flash message" do
				expect(flash[:success]).to eq("Successfuly Signed in")
			end
			it "creates a session variable for the valid input" do
				expect(session[:user_id]).to eq(user.id)
			end
		end

		context "un-successful Sign-In" do
			it "set a unsuccessful flash message" do
				post :create, {email: user.email, password: "worngpassword"}
				expect(flash[:danger]).to be_present
			end
		end
	end


	describe "DELETE #destroy" do
		before do
			session[:user_id] = user.id
			delete :destroy, id: user.id
		end

		it "to log out the user" do
			expect(session[:user_id]).to be_nil
		end

		it "displays a logout flash" do
			expect(flash[:success]).to eq("Successfuly Signed Out")
		end

		it "redirects to root path" do
			expect(response).to redirect_to root_path
		end
	end
end
