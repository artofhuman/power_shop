FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Test category-#{n}"}
  end
end
