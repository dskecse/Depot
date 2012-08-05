require 'spec_helper'

describe 'store/index.html.erb' do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        title:       'MyString',
        description: 'MyText',
        image_url:   'fred.gif',
        price: 9.99
      ),
      stub_model(Product,
        title:       'Drunken Octo Hipster',
        description: 'MyText',
        image_url:   'fred.gif',
        price: 9.99
      )
    ])
    render
  end

  it 'renders a list of products' do
    assert_select '.entry h3',  count: 2
    assert_select '.entry',     count: 2
    assert_select '.entry img', count: 2
    assert_select '.entry .price_line .price', count: 2
  end

  it 'shows formatted price' do
    assert_select '.price', /\A\$[,\d]+\.\d\d\z/
  end
end
