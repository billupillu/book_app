class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

	def order_total
		#require 'pry';binding.pry
		#order_items.map {|order_item| order_item.quantity*order_item.price}.reduce(:+)
				#OR
		order_items.to_a.inject(0.0) {|sum, order_item| sum+ order_item.quantity*order_item.price}
	end	
end
