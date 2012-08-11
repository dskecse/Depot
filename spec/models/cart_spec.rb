require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }

  it 'is valid with valid attributes' do
    cart.should be_valid
  end

  it 'should add products' do
    pending
    item = FactoryGirl.create(:line_item)
    another_item = FactoryGirl.create(:line_item)
    cart.line_items.size.should == 2
  end
end
