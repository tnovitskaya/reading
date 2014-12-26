FactoryGirl.define do
  factory :book do
    name { Faker::Commerce.product_name }
    genre { Faker::Lorem.word }
    page_count { Faker::Number.number(3) }
    association :publisher
  end
end
