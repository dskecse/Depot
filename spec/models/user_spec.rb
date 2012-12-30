require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  specify { user.should be_valid }

  describe '.email' do
    it 'is required' do
      user.email = nil
      user.should have(1).error_on(:email)
    end
  end

  describe '#is?' do
    it 'should return true if string matches user\'s role' do
      user.is?('user').should be_true
    end

    it 'should return false if string does not match users\'s role' do
      user.is?('fault_role').should be_false
    end
  end
end
