require 'rails_helper'

RSpec.describe 'ジャンルの新規登録', type: :system do
  let(:user){ FactoryBot.create(:user) }

  before do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: 'test123'
    click_button 'ログイン'
  end

  describe 'Genre' do
    context 'フォームの入力値が正常' do
      it 'ジャンルの登録に成功' do
        # ジャンル画面へ遷移
        expect(page).to have_content 'My Note'
        # +ボタンをクリック
        find("#gbtn").double_click
        # フォームに「ジャンル」と入力
        fill_in 'genre[name]', with: 'ジャンル'
        # 「登録」ボタンをクリック
        click_button '登録'
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        expect(page).to have_content 'ジャンルの登録に成功しました'
        end
      end

      context 'フォームの入力値が空白' do
        it 'ジャンルの登録にできない' do
          # ジャンル画面へ遷移
          expect(page).to have_content 'My Note'
          # +ボタンをクリック
          find("#gbtn").double_click
          # フォームに「ジャンル」と入力
          fill_in 'genre[name]', with: ''
          # 「登録」ボタンをクリック
          click_button '登録'
          # 遷移されたページに'User was successfully created.'の文字列があることを期待する
          expect(page).to have_content 'ジャンルの登録に失敗しました'
        end
      end
    end
  end