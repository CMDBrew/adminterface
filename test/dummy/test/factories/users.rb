FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    name { Faker::Name.name }
    password { "password" }
    confirmed_at { Time.current } # Skip devise confirmable email
  end
end
