FactoryBot.define do
  factory :inquiry do
    email { "test@example.com" }
    message { "メール届いてますか？" }
  end
end
