require 'spec_helper'

describe OrderNotifier do
  let(:order) { FactoryGirl.create(:order) }

  describe 'received' do
    let(:mail) { OrderNotifier.received(order) }

    context 'renders the header of' do
      it 'the subject' do
        mail.subject.should eq('Pragmatic Store Order Confirmation')
      end

      it 'order email' do
        mail.to.should eq([order.email])
      end

      it 'sender email' do
        mail.from.should eq(['dskecse@gmail.com'])
      end
    end

    it 'renders the body' do
      mail.body.encoded.should match('You ordered the following items:')
    end
  end

  describe 'shipped' do
    let(:mail) { OrderNotifier.shipped(order) }

    context 'renders the header of' do
      it 'the subject' do
        mail.subject.should eq('Pragmatic Store Order Shipped')
      end

      it 'order email' do
        mail.to.should eq([order.email])
      end

      it 'sender email' do
        mail.from.should eq(['dskecse@gmail.com'])
      end
    end

    it 'renders the body' do
      mail.body.encoded.should match('shipped your recent order:')
    end
  end
end
