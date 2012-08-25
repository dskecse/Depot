FactoryGirl.define do
  factory :order do
    name    'David Hansson'
    address '123 Ocean Ave, Miami, FL'
    email   'david@example.com'
    association :payment_type
  end
end
