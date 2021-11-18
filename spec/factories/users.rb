FactoryBot.define do
  factory :user do
    name {'テストユーザー'}
    email {'test@example.com'}
    password {'test'}
    password_confirmation {'test'}
  end
end