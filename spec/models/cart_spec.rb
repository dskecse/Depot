require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }

  it 'is valid with valid attributes' do
    cart.should be_valid
  end

  it 'should contain line_items' do
    FactoryGirl.create(:line_item, cart_id: cart)
    FactoryGirl.create(:line_item, cart_id: cart,
                       product_id: FactoryGirl.create(:product, title: 'Octo Hipster'))
    cart.line_items.size.should == 2
  end
end
