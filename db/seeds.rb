
# Create Users
5.times do
  User.create!(
  name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end

users = User.all
