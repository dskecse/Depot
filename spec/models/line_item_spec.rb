require 'spec_helper'

describe LineItem do
  [:order, :product, :cart].each do |association|
    it { should belong_to(association) }
  end
end
