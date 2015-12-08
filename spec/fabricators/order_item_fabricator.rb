Fabricator(:order_item) do
	order
	book
	quantity {Faker::Number.number(2)}
	price {Faker::Number.number(2)}
end
