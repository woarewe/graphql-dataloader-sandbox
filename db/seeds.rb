
ActiveRecord::Base.logger = Logger.new($stdout)

users = Array.new(100) do
  User.create!(
    first_name: Faker::Name.unique.name,
    last_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
  )
end

posts = users.flat_map do |user|
  Post.create!(user:, body: Faker::Lorem.unique.paragraph, title: Faker::Lorem.unique.sentence)
end


posts.each do |post|
  commenters = users.sample(5)

  commenters.each do |user|
    Comment.create!(post:, user:, body: Faker::Lorem.unique.paragraph)
  end
end
