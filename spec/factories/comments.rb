FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    association :user
    association :interest
  end
end
