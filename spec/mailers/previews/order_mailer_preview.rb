# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
	def notify_on_successful_order
		
		customer = User.create(username: "john")
		publisher = Publisher.create(name: "GoodPub")

		book1 = Book.create(title: 'FirstBook', price: 10, isbn: "1"*13, page_count: 100, description: "my phirst beuke", publisher: publisher)
		book2 = Book.create(title: 'SecondBook', price: 20, isbn: "2"*13, page_count: 200, description: "my second beuke", publisher: publisher)

		order = Order.create

		order_item1 = order.order_items.create(book: book1, quantity: 2, price: book1.price)
		order_item2 = order.order_items.create(book: book2, quantity: 3, price: book2.price)

		OrderMailer.notify_on_successful_order(customer, order)
	end
end
