# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title       'You can call me Beercules'
    description 'MyText'
    image_url   'ruby.jpg'
    price       9.99
  end
end
