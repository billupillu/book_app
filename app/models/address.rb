class Address < ActiveRecord::Base
  belongs_to :user

  validates :addres_line1, :city, :state, :zipcode, presence: true
end
