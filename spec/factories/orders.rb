FactoryGirl.define do
  factory :order do
    name    'David Hansson'
    address '123 Ocean Ave, Miami, FL'
    email   'david@37signals.com'
    payment_type 'Check'
  end
end
