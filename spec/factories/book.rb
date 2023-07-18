FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    author  { Faker::Book.author }
    published_on  { Faker::Date.between(from: 10.years.ago, to: 1.year.ago) }
  end
end
