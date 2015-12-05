Fabricator(:cart_item) do
	book
	cart
	price {Faker::Commerce.price}
	quantity {Faker::Number.number(1)}
end
