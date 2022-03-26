FactoryBot.define do
  factory :user, class: 'User' do
    id {'1'}
    name {'テストユーザー'}
    email {'test@example.com'}
    password {'test123'}
    password_confirmation {'test123'}
    admin {'false'}
  end

  factory :admin, class: 'User' do
    id {'2'}
    name {'管理者'}
    email {'admin@example.com'}
    password {'admin123'}
    password_confirmation {'admin123'}
    admin {'true'}
  end
end