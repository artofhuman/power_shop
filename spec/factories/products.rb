FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Test product-#{n}"}
    association :category
    price 1000

    factory :disabled_product do
      active false
    end
  end
end
