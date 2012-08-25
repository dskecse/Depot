require 'spec_helper'

describe PaymentType do
  let(:payment_type) { FactoryGirl.create(:payment_type) }

  it 'is valid with valid attributes' do
    payment_type.should be_valid
  end

  describe '.name' do
    it 'is required' do
      payment_type.name = nil
      payment_type.should have(1).error_on(:name)
    end
  end
end
