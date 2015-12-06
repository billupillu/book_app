Fabricator(:address) do 
	addres_line1 {Faker::Address.street_address}
	address_line2 {Faker::Address.secondary_address}
	city {Faker::Address.city}
	state {Faker::Address.state}
	zipcode {Faker::Address.zip_code}
end