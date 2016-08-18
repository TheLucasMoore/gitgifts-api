require 'faker'

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    name {Faker::Name.name}
    uid {Faker::Company.australian_business_number}
    provider "github"
    github {Faker::Internet.user_name}
    github_url {Faker::Internet.url}
    avatar_url {Faker::Avatar.image}
    city {Faker::Address.city}
    bio {Faker::Lorem.sentence(3, true, 4)}
  end
end
