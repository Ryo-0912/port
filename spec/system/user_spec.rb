require 'rails_helper'

describe 'User CRUD' do
  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功' do
        # ユーザー新規登録画面へ遷移
        visit new_user_path
        # Nameテキストフィールドにテストユーザーと入力
        fill_in 'Name', with: 'テストユーザー'
        # Emailテキストフィールドにtest@example.comと入力
        fill_in 'Email', with: 'test@example.com'
        # Passwordテキストフィールドにpasswordと入力
        fill_in 'Password', with: 'password'
        # Password confirmationテキストフィールドにpasswordと入力
        fill_in 'Password confirmation', with: 'password'
        # SignUpと記述のあるsubmitをクリックする
        click_button '登録'
        # login_pathへ遷移することを期待する
        expect(current_path).to eq login_path
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'メールアドレスでログイン'
      end
    end

    context 'アカウント名未記入' do
      it 'ユーザーの新規作成が失敗' do
        # ユーザー新規登録画面へ遷移
        visit new_user_path
        # Nameテキストフィールドにテストユーザーと入力
        fill_in 'Name', with: 'テストユーザー'
        # Emailテキストフィールドをnil状態にする
        fill_in 'Email', with: nil
        # Passwordテキストフィールドにpasswordと入力
        fill_in 'Password', with: 'password'
        # Password confirmationテキストフィールドにpasswordと入力
        fill_in 'Password confirmation', with: 'password'
        # SignUpと記述のあるsubmitをクリックする
        click_button '登録'
        # users_pathへ遷移することを期待する
        expect(current_path).to eq users_path
        # 遷移されたページに'Email can't be blank'の文字列があることを期待する
        expect(page).to have_content "メールアドレスを入力してください"
      end
    end


    context 'メールアドレス未記入' do
      it 'ユーザーの新規作成が失敗' do
        # ユーザー新規登録画面へ遷移
        visit new_user_path
        # Nameテキストフィールドにテストユーザーと入力
        fill_in 'Name', with: 'テストユーザー'
        # Emailテキストフィールドをnil状態にする
        fill_in 'Email', with: nil
        # Passwordテキストフィールドにpasswordと入力
        fill_in 'Password', with: 'password'
        # Password confirmationテキストフィールドにpasswordと入力
        fill_in 'Password confirmation', with: 'password'
        # SignUpと記述のあるsubmitをクリックする
        click_button '登録'
        # users_pathへ遷移することを期待する
        expect(current_path).to eq users_path
        # 遷移されたページに'Email can't be blank'の文字列があることを期待する
        expect(page).to have_content "メールアドレスを入力してください"
      end
    end

    context 'パスワードの未記入' do
      it 'ユーザーの新規作成が失敗' do
        # ユーザー新規登録画面へ遷移
        visit new_user_path
        # Nameテキストフィールドにテストユーザーと入力
        fill_in 'Name', with: 'テストユーザー'
        # Emailテキストフィールドをnil状態にする
        fill_in 'Email', with: 'test@example.com'
        # Passwordテキストフィールドにpasswordと入力
        fill_in 'Password', with: nil
        # Password confirmationテキストフィールドにpasswordと入力
        fill_in 'Password confirmation', with: nil
        # SignUpと記述のあるsubmitをクリックする
        click_button '登録'
        # users_pathへ遷移することを期待する
        expect(current_path).to eq users_path
        # 遷移されたページに'Email can't be blank'の文字列があることを期待する
        expect(page).to have_content "パスワードを入力してください"
      end
    end
  end
end