class Cart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	has_many :books, through: :cart_items

		def add_book_to_cart_items(book_id)
			#require 'pry';binding.pry
			cart_item = cart_items.where(book_id: book_id).first

			# array of single item or nil

			if cart_item.nil?

				price = Book.find(book_id).price
				cart_item = cart_items.create(book_id: book_id, quantity: 1, price: price)
			else
				quantity = cart_items.quantity + 1
				cart_items.update(quantity: quantity)
				cart_item
			end
		end

		def total_sale
			#require 'pry';binding.pry
			cart_items.map {|item| item.line_total}.reduce(:+) || 0.0
		end

		def total_sale_in_cents
			(total_sale*100).to_i
		end
end
