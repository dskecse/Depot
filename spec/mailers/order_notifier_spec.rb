require 'spec_helper'

describe OrderNotifier do
  let(:order) { FactoryGirl.create(:order) }

  describe '#received' do
    let(:mail) { OrderNotifier.received(order) }

    context 'renders the headers' do
      it { expect(mail.subject).to eq('Pragmatic Store Order Confirmation') }
      it { expect(mail.to).to eq([order.email]) }
      it { expect(mail.from).to eq(['dskecse@gmail.com']) }
    end

    it { expect(mail.body.encoded).to match('You ordered the following items:') }
  end

  describe '#shipped' do
    let(:mail) { OrderNotifier.shipped(order) }

    context 'renders the headers' do
      it { expect(mail.subject).to eq('Pragmatic Store Order Shipped') }
      it { expect(mail.to).to eq([order.email]) }
      it { expect(mail.from).to eq(['dskecse@gmail.com']) }
    end

    it { expect(mail.body.encoded).to match('shipped your recent order:') }
  end
end
