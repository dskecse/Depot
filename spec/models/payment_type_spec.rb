require 'spec_helper'

describe PaymentType do
  let(:payment_type) { FactoryGirl.create(:payment_type) }

  it 'is valid with valid attributes' do
    payment_type.should be_valid
  end
end
