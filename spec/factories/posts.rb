require 'faker'

FactoryGirl.define do
  factory :post do
    project
    user
    title {Faker::Book.title}
    description {Faker::Hipster.sentence(3)}
  end
end
