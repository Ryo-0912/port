require "rails_helper"

describe InquiryMailer do

  let(:inquiry) { FactoryBot.create(:inquiry) }

  describe '#send_mail' do
    subject(:mail) do
      InquiryMailer.send_mail.deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'when send_mail' do
      it { expect(mail(inquiry).from.first).to eq('test@example.com') }
      it { expect(mail(inquiry).to.first).to eq('admin@example.com') }
      it { expect(mail(inquiry).subject).to eq('お問い合わせ通知') }
    end
  end
end