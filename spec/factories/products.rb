# coding: utf-8
FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Test product-#{n}"}
    association :category
    price 1000
    active true

    factory :disabled_product do
      active false
    end
  end
end
