class User < ActiveRecord::Base
	has_many :addresses
	has_secure_password

	accepts_nested_attributes_for :addresses

	regx = /\A[\w+\-.|\_]+@[a-z\d\-.]+\.[a-z]{2,4}\z/i
	validates :username, presence: true
	validates :email, presence: true, 
					  format: {with: regx},
					  uniqueness: true

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
	end	


end
