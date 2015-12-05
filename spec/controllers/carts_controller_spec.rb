require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "GET #show" do
    let(:cart) {Fabricate(:cart)}

    it "returns http success" do
      get :show, id: cart.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    let(:cart) {Fabricate(:cart)}

    it "sets cart session to nil" do
      delete :destroy, id: cart.id
      expect(session[:cart_id]).to be_nil
    end

  end

end
