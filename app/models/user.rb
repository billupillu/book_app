class User < ActiveRecord::Base
	has_secure_password

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
