require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do

  let(:user){ FactoryBot.create(:user) }
  let(:admin){ FactoryBot.create(:admin) }
  let(:inquiry) { FactoryBot.create(:inquiry) }
  let(:mail) { InquiryMailer.send_mail }

  it 'when send mail' do
    expect(mail(inquiry).from.first).to eq(user.mail)
    expect(mail(inquiry).to.first).to eq(admin.mail)
  end
end