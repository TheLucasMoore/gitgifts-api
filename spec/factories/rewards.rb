FactoryGirl.define do
  factory :reward do
    user
    project
    amount {Faker::Number.number(4)}
    description {Faker::Lorem.sentence(5)}
    title {Faker::Book.title}
  end
end
