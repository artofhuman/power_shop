FactoryGirl.define do
  factory :order do
  end

  factory :order_item do
    association :order
    association :product

    price 500
    product_title { product.name }
    quantity 1
  end
end
