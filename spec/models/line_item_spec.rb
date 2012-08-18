require 'spec_helper'

describe LineItem do
  let(:line_item) { FactoryGirl.create(:line_item) }

  it 'is valid with valid attributes' do
    line_item.should be_valid
  end
end
