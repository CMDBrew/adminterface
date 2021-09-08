FactoryBot.define do
  factory :user_address do
    fullname { Faker::Name.name }
    address_line1 { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code }
    country { Faker::Address.country }

    association :user
  end
end
