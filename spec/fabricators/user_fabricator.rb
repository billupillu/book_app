Fabricator(:user) do
	username { Faker::Internet.user_name }
	email {Faker::Internet.email}
	password {Faker::Internet.password(8)}
	admin false
end

Fabricator(:admin, from: :user) do
	admin true
end
