FactoryGirl.define do
  factory :project do
    association :user, factory: :user
    goal 100000
    title "Project To Build An App"
    description "Support the community. Donate today"
  end
end
