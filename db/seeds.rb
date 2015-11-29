# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Publisher.create(name: "#{Faker::Book.publisher}")
Publisher.create(name: "#{Faker::Book.publisher}")
Publisher.create(name: "#{Faker::Book.publisher}")
Publisher.create(name: "#{Faker::Book.publisher}")
Publisher.create(name: "#{Faker::Book.publisher}")

Author.create(first_name: "#{Faker::Name.first_name}", second_name: "#{Faker::Name.last_name}")
Author.create(first_name: "#{Faker::Name.first_name}", second_name: "#{Faker::Name.last_name}")
Author.create(first_name: "#{Faker::Name.first_name}", second_name: "#{Faker::Name.last_name}")
Author.create(first_name: "#{Faker::Name.first_name}", second_name: "#{Faker::Name.last_name}")
Author.create(first_name: "#{Faker::Name.first_name}", second_name: "#{Faker::Name.last_name}")


Book.create(
		title: "#{Faker::Book.title}",
		isbn: "1"*13,
		description: "#{Faker::Lorem.paragraph}",
		published_at: "#{Faker::Date.backward(14)}",
		publisher_id: "2",
		page_count: "#{Faker::Number.number(3)}",
		price: "#{Faker::Commerce.price}",
		book_cover: File.open(File.join(Rails.root, "app/assets/images/test_book.jpg"))
	)
Book.create(
		title: "#{Faker::Book.title}",
		isbn: "2"*13,
		description: "#{Faker::Lorem.paragraph}",
		published_at: "#{Faker::Date.backward(14)}",
		publisher_id: "3",
		page_count: "#{Faker::Number.number(3)}",
		price: "#{Faker::Commerce.price}",
		book_cover: File.open(File.join(Rails.root, "app/assets/images/test_book.jpg"))
	)
Book.create(
		title: "#{Faker::Book.title}",
		isbn: "3"*13,
		description: "#{Faker::Lorem.paragraph}",
		published_at: "#{Faker::Date.backward(14)}",
		publisher_id: "4",
		page_count: "#{Faker::Number.number(3)}",
		price: "#{Faker::Commerce.price}",
		book_cover: File.open(File.join(Rails.root, "app/assets/images/test_book.jpg"))
	)
Book.create(
		title: "#{Faker::Book.title}",
		isbn: "4"*13,
		description: "#{Faker::Lorem.paragraph}",
		published_at: "#{Faker::Date.backward(14)}",
		publisher_id: "3",
		page_count: "#{Faker::Number.number(3)}",
		price: "#{Faker::Commerce.price}",
		book_cover: File.open(File.join(Rails.root, "app/assets/images/test_book.jpg"))
	)
Book.create(
		title: "#{Faker::Book.title}",
		isbn: "5"*13,
		description: "#{Faker::Lorem.paragraph}",
		published_at: "#{Faker::Date.backward(14)}",
		publisher_id: "5",
		page_count: "#{Faker::Number.number(3)}",
		price: "#{Faker::Commerce.price}",
		book_cover: File.open(File.join(Rails.root, "app/assets/images/test_book.jpg"))
	)
