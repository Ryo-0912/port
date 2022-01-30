FactoryBot.define do
  factory :user do
    name {'テストユーザー'}
    email {'test@example.com'}
    password {'test123'}
    password_confirmation {'test123'}
  end
end