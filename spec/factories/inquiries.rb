FactoryBot.define do
  factory :inquiry do
    subject {"お問い合わせ通知"}
    email { "test@example.com" }
    message { "メール届いてますか？" }
    user
  end
end
