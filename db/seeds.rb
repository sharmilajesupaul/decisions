require 'Faker'
# Creates 5 users
5.times do
  User.create(username: Faker::Internet.user_name, password: 'password', display_name: Faker::Name.name)
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

user_ids = []
User.all.each_index do |index|
  user_ids << index+1
end

Post.all.each do |post|
  post.update_attributes(user_id: User.find(user_ids.sample).id)
end


User.all.each do |user|
  user.posts.each do |post|
    10.times { post.weights << Weight.create(content: Faker::Lorem.sentence, pro: boolean.sample, user: User.find(user_ids.sample)) }
  end
end


