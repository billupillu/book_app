class Author < ActiveRecord::Base
  validates :first_name, presence: true
  validates :second_name, presence: true

  def full_name
    "#{first_name} #{second_name}"
  end

  scope :recent, lambda {order("authors.created_at DESC")}
end
