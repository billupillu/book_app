require 'rails_helper'
require 'support/macro'

RSpec.describe CartItemsController, type: :controller do
	let(:book) {Fabricate(:book)}
	let(:cart) {Fabricate(:cart)}

	before {save_session_cart cart}


	describe "POST #create" do
		it "creates a new cart_item object" do
			post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book, cart: cart), book_id: book.id	
			expect(CartItem.count).to eq(1)
		end

		it "redirects to cart show action" do
			post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book, cart: cart), book_id: book.id	
			expect(response).to redirect_to cart_path(Cart.last.id)
		end
	end
end
