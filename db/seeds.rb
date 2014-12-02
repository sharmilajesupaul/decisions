require 'Faker'
# Creates 5 users
5.times do
  User.create(username: Faker::Internet.user_name, password: 'password')
end

# Creates Posts for each user
User.all.each do |user|
  3.times { user.posts << Post.create(title: Faker::Name.title, content: Faker::Lorem.sentence) }
end

# Updates weights to havec content and random boolean sampling
boolean = [true, false]
Weight.all.each do |weight|
  weight.update_attributes(content: Faker::Lorem.sentence, pro: boolean.sample)
end