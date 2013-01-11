require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create(:user) }

  it { should have_many(:orders) }
  it { should have_one(:cart) }

  it { should validate_uniqueness_of(:email) }

  describe '#is?' do
    it 'should return true if string matches user\'s role' do
      expect(user.is?('user')).to be_true
    end

    it 'should return false if string does not match users\'s role' do
      expect(user.is?('fault_role')).to be_false
    end
  end
end
