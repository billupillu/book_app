class CartItemsController < ApplicationController
	before_action :set_cart
		
	def create
		#require 'pry';binding.pry
		@cart_item = @cart.add_book_to_cart_items(params[:book_id])
		respond_to do |format|
			if @cart_item
				flash[:success] = "Item added to cart"
				format.html {redirect_to @cart_item.cart}
				format.js
			else
				flash[:danger] = "Item was not added to cart *ERROR*"
				format.html {redirect_to catalogs_path}	
			end
		end	
	end

end
