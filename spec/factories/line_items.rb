FactoryGirl.define do
  factory :line_item do
    association :product
    association :cart
    association :order
    price    9.99
    quantity 1
  end
end
