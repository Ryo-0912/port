FactoryBot.define do
  factory :user do
    id {'1'}
    name {'テストユーザー'}
    email {'test@example.com'}
    password {'test123'}
    password_confirmation {'test123'}
    admin {'false'}
  end
end