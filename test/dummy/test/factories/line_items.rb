FactoryBot.define do
  factory :line_item do
    association :order
    association :product
  end
end
