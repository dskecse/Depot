FactoryGirl.define do
  factory :user do
    email    'customer@example.com'
    password 'secret'
    confirmed_at Time.now

    factory :admin do
      email 'admin@example.com'
      role  'admin'
    end
  end
end
