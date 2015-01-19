FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    date_of_birth { Faker::Time.between(10000.days.ago, 10000.days.ago) }
    phone { Faker::PhoneNumber.cell_phone }
    role "user"
  end
end