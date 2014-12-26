FactoryGirl.define do
  factory :book_and_author_link do
    role "author"
    association :book
    association :author
  end
end
