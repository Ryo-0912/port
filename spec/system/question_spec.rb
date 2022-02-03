require 'rails_helper'

RSpec.describe '問題の新規登録', type: :system do
  let(:user){ FactoryBot.create(:user) }

  before do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: 'test123'
    click_button 'ログイン'
    # ジャンル画面へ遷移
    expect(page).to have_content 'My Note'
    # +ボタンをクリック
    find("#gbtn").double_click
    # フォームに「ジャンル」と入力
    fill_in 'genre[name]', with: 'ジャンル'
    # 「登録」ボタンをクリック
    click_button '登録'
  end

  describe 'Question' do
    context 'フォームの入力値が正常' do
      it '問題の登録に成功' do
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
      end
    end
  end
end