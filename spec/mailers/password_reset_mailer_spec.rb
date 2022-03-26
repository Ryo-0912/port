require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  let(:mail) { UserMailer.reset_password_email(user) }

  before { user.generate_reset_password_token! }

  describe '想定どおりのメールが作成されている' do
    it 'ヘッダー情報・ボディ情報が正しいこと' do
      #20~22行では、ちゃんとメール送信が行われていることを確認している
      expect do
        mail.deliver_now #メールの送信方法 deliver_now(今すぐメール送信) deliver_later(後でメール送信)
      end.to change { ActionMailer::Base.deliveries.size }.by(1) #deliveries.sizeメールの数
      # ヘッダー
      expect(mail.subject).to eq('パスワードリセット')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
      # ボディ
      expect(mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join).to match(edit_password_reset_url(user.reset_password_token))
    end
  end

end