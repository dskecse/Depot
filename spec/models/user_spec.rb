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
end
