require 'spec_helper'

describe Order do
  let(:order) { FactoryGirl.create(:order) }

  it 'is valid with valid attributes' do
    order.should be_valid
  end

  describe '.name' do
    it 'is required' do
      order.name = nil
      order.should have(1).error_on(:name)
    end
  end

  describe '.address' do
    it 'is required' do
      order.address = nil
      order.should have(1).error_on(:address)
    end
  end

  describe '.email' do
    it 'is required' do
      order.email = nil
      order.should have(1).error_on(:email)
    end
  end

  describe '.payment_type_id' do
    it 'is required' do
      order.payment_type_id = nil
      order.should have(1).error_on(:payment_type_id)
    end
  end
end
