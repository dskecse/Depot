require 'spec_helper'

describe ErrorNotifier do
  describe 'denied' do
    let(:cart) { FactoryGirl.create(:cart) }
    let(:mail) { ErrorNotifier.denied(cart) }

    context 'renders the header of' do
      it 'the subject' do
        mail.subject.should eq("Attempt to access invalid cart")
      end

      it 'admin mail' do
        mail.to.should eq(['dskecse@gmail.com'])
      end

      it 'sender mail' do
        mail.from.should eq(['dskecse@gmail.com'])
      end
    end

    it 'renders the body' do
      mail.body.encoded.should match('Attempt to access invalid cart')
    end
  end
end
