require 'spec_helper'

describe Order do
  it { should have_many(:line_items) }
  it { should belong_to(:payment_type) }
  it { should belong_to(:user) }

  [:name, :address, :email, :payment_type_id].each do |field|
    subject { FactoryGirl.create(:order) }
    it { should validate_presence_of(field) }
  end
end
