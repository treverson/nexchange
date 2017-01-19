
# Create Users
10.times do
  User.create!(
    name:     Faker::Pokemon.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end

users = User.all

10.times do
  Group.create!(
    title: Faker::Book.title,
    description: Faker::Hacker.say_something_smart,
  )
end

groups = Group.all

5.times do
  Project.create!(
    title: Faker::App.name,
    description: Faker::Company.catch_phrase,
    creator: users.sample[:name],
    projectable_type: Group,
    projectable_id: groups.sample[:id]
  )
end

5.times do
  creator = users.sample
  Project.create!(
    title: Faker::Hacker.adjective,
    description: Faker::Hipster.sentence,
    creator: creator[:name],
    projectable_type: User,
    projectable_id: creator[:id]
)
end

projects = Project.all
