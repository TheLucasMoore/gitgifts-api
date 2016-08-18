require 'faker'

### User Seeds ###
  10.times do
    User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Name.name,
    uid: Faker::Company.australian_business_number,
    provider: "github",
    github: Faker::Internet.user_name,
    github_url: Faker::Internet.url,
    avatar_url: Faker::Avatar.image,
    city: Faker::Address.city,
    bio: Faker::Lorem.sentence(3, true, 4)
    )
  end

  10.times do
    Project.create(
    user_id: Faker::Number.between(1, 10),
    goal: Faker::Number.between(1, 10000),
    title: Faker::Hipster.sentence(3),
    description: Faker::Hipster.sentence(10)
    )
  end

  10.times do
    Reward.create(
    project_id: Faker::Number.between(1, 10),
    user_id: Faker::Number.between(1, 10),
    amount: Faker::Number.between(1, 500),
    description: Faker::Hipster.sentence(10)
    )
  end

  10.times do
    Post.create(
    project_id: Faker::Number.between(1, 10),
    user_id: Faker::Number.between(1, 10),
    title: Faker::Hipster.sentence(3),
    description: Faker::Hipster.sentence(10)
    )
  end
