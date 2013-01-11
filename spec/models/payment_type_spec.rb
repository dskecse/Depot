require 'spec_helper'

describe PaymentType do
  subject(:payment_type) { FactoryGirl.create(:payment_type) }

  it { should have_many(:orders) }
  it { should validate_presence_of(:name) }
end
