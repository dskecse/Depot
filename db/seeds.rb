Product.create!(title: 'Programming Ruby 1.9',
                description: %(<p>
                  Ruby is the fastest growing and most exciting dynamic language
                  out there. If you need to get working programs delivered fast,
                  you should add Ruby to your toolbox.
                  </p>),
                image_url: 'ruby.jpg',
                price: 49.95)
Product.create!(title: 'CoffeeScript',
                description: %(<p>
                  CoffeeScript is JavaScript done right. It provides all of
                  JavaScript's functionality wrapped in a cleaner, more succinct syntax.
                  In the first book on this exciting new language, CoffeeScript guru
                  Trevor Burnham shows you how to hold onto all the power and flexibility
                  of JavaScript while writing cleaner, cleaner, and safer code.
                  </p>),
                image_url: 'cs.jpg',
                price: 44.99)
Product.create!(title: 'Rails Test Prescriptions',
                description: %(<p>
                  <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
                  Rails applications, covering Test-Driven Development from both a
                  theoretical perspective (why to test) and from a practical perspective
                  (how to test effectively). It covers the core Rails testing tools and
                  procedures for Rails 2 and Rails 3, and introduces popular add-ons,
                  including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
                  </p>),
                image_url: 'rtp.jpg',
                price: 43.75)

['Check', 'Credit card', 'Purchase order'].each { |payment_type| PaymentType.create!(name: payment_type) }

Order.transaction do
  30.times do
    Order.create!(name:    'Dave Thomas',
                  address: '12 Ocean Ave',
                  email:   'customer@gmail.com',
                  payment_type_id: PaymentType.find_by_name('Check'))
  end
end
