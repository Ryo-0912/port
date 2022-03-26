require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'User CRUD' do
    describe 'ログイン前' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功' do
          # ユーザー新規登録画面へ遷移
          visit new_user_path
          # Nameテキストフィールドにテストユーザーと入力
          fill_in 'user[name]', with: @user.name
          # Emailテキストフィールドにtest@example.comと入力
          fill_in 'user[email]', with: @user.email
          # Passwordテキストフィールドにpasswordと入力
          fill_in 'user[password]', with: @user.password
          # Password confirmationテキストフィールドにpasswordと入力
          fill_in 'user[password_confirmation]', with: @user.password_confirmation
          # SignUpと記述のあるsubmitをクリックする
          click_button '登録'
          # login_pathへ遷移することを期待する
          expect(page).to have_current_path("/login")
          # 遷移されたページに'User was successfully created.'の文字列があることを期待する
          expect(page).to have_content 'メールアドレスでログイン'
        end
      end

      context 'アカウント名未記入' do
        it 'ユーザーの新規作成が失敗' do
          # ユーザー新規登録画面へ遷移
          visit new_user_path
          # Nameテキストフィールドにテストユーザーと入力
          fill_in 'user[name]', with: nil
          # Emailテキストフィールドをnil状態にする
          fill_in 'user[email]', with: @user.email
          # Passwordテキストフィールドにpasswordと入力
          fill_in 'user[password]', with: @user.password
          # Password confirmationテキストフィールドにpasswordと入力
          fill_in 'user[password_confirmation]', with: @user.password_confirmation
          # SignUpと記述のあるsubmitをクリックする
          click_button '登録'
          # users_pathへ遷移することを期待する
          expect(page).to have_current_path("/users")
          # 遷移されたページに'Email can't be blank'の文字列があることを期待する
          expect(page).to have_content "アカウント名を入力してください"
        end
      end


      context 'メールアドレス未記入' do
        it 'ユーザーの新規作成が失敗' do
          # ユーザー新規登録画面へ遷移
          visit new_user_path
          # Nameテキストフィールドにテストユーザーと入力
          fill_in 'user[name]', with: @user.name
          # Emailテキストフィールドをnil状態にする
          fill_in 'user[email]', with: nil
          # Passwordテキストフィールドにpasswordと入力
          fill_in 'user[password]', with: 'password'
          # Password confirmationテキストフィールドにpasswordと入力
          fill_in 'user[password_confirmation]', with: 'password'
          # SignUpと記述のあるsubmitをクリックする
          click_button '登録'
          # users_pathへ遷移することを期待する
          expect(page).to have_current_path("/users")
          # 遷移されたページに'Email can't be blank'の文字列があることを期待する
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end

      context 'パスワードの未記入' do
        it 'ユーザーの新規作成が失敗' do
          # ユーザー新規登録画面へ遷移
          visit new_user_path
          # Nameテキストフィールドにテストユーザーと入力
          fill_in 'user[name]', with: @user.name
          # Emailテキストフィールドをnil状態にする
          fill_in 'user[email]', with: @user.email
          # Passwordテキストフィールドにpasswordと入力
          fill_in 'user[password]', with: nil
          # Password confirmationテキストフィールドにpasswordと入力
          fill_in 'user[password_confirmation]', with: @user.password_confirmation
          # SignUpと記述のあるsubmitをクリックする
          click_button '登録'
          # users_pathへ遷移することを期待する
          expect(page).to have_current_path("/users")
          # 遷移されたページに'Email can't be blank'の文字列があることを期待する
          expect(page).to have_content "パスワードは3文字以上で入力してください"
        end
      end

      context 'パスワード確認用が未記入' do
        it 'ユーザーの新規作成が失敗' do
          # ユーザー新規登録画面へ遷移
          visit new_user_path
          # Nameテキストフィールドにテストユーザーと入力
          fill_in 'user[name]', with: @user.name
          # Emailテキストフィールドをnil状態にする
          fill_in 'user[email]', with: @user.email
          # Passwordテキストフィールドにpasswordと入力
          fill_in 'user[password]', with: @user.password
          # Password confirmationテキストフィールドにpasswordと入力
          fill_in 'user[password_confirmation]', with: nil
          # SignUpと記述のあるsubmitをクリックする
          click_button '登録'
          # users_pathへ遷移することを期待する
          expect(page).to have_current_path("/users")
          # 遷移されたページに'Email can't be blank'の文字列があることを期待する
          expect(page).to have_content "パスワード確認用を入力してください"
        end
      end
    end
  end
end