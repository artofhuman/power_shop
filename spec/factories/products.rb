FactoryGirl.define do
  factory :product do
    name 'Тестовый товар'
    association :category
    price 1000
  end
end
