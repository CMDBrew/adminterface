FactoryBot.define do
  factory :product do
    title { Faker::Book.title }
    price { Faker::Number.decimal(l_digits: 2) }
    available_on { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
