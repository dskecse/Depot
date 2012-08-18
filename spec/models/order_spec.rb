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

  describe '.payment_type' do
    it 'is required' do
      order.payment_type = nil
      order.should have(1).error_on(:payment_type)
    end

    it 'should be included in a list' do
      order = FactoryGirl.create(:order, payment_type: 'Purchase order')
      order.should be_valid
    end

    it 'should be included in a list' do
      order = FactoryGirl.build(:order, payment_type: 'None')
      order.should have(1).error_on(:payment_type)
    end
  end
end
