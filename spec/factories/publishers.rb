FactoryGirl.define do
  factory :publisher do
    name { Faker::Company.name }
    location { Faker::Address.city }
  end
end
