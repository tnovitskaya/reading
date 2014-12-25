FactoryGirl.define do
  factory :interest do
    review { Faker::Lorem.paragraph }
    start_reading { Faker::Time.between(100.days.ago, 10.days.ago) }
    finish_reading { Faker::Time.between(10.days.ago, Time.now) }
    association :user
    association :book
  end
end
