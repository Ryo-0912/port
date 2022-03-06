require 'rails_helper'

RSpec.describe '解答の新規登録', type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:genre){ FactoryBot.create(:genre) }

  before do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: 'test123'
    click_button 'ログイン'
    # ジャンル画面へ遷移
    expect(page).to have_content 'My Nort'
    # +ボタンをクリック
    find("#gbtn").double_click
    # フォームに「ジャンル」と入力
    fill_in 'genre[name]', with: 'ジャンル'
    # 「登録」ボタンをクリック
    click_button '登録'
  end

  describe 'Answer' do
    context 'フォームの入力値が正常' do
      it '解答の登録に成功' do
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set('Answer')
        find('#answer_process', visible: false).set('Answer_process')
        click_button '登録'
        expect(page).to have_content '解答の登録に成功しました'
      end

      it 'テスト日の登録に成功' do
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set('Answer')
        find('#answer_process', visible: false).set('Answer_process')
        click_button '登録'
        expect(page).to have_content '解答の登録に成功しました'
        find('#answer_exam', visible: false).set('2022/03/01')
        click_button '登録'
      end
    end

    context 'フォームの入力値が異常' do
      it '解答の登録に失敗' do
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set(nil)
        find('#answer_process', visible: false).set('Answer_process')
        click_button '登録'
        expect(page).to have_content '解答を入力してください'
      end
    end

    context 'フォームの入力値が異常' do
      it '解答プロセスの登録に失敗' do
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set('Answer')
        find('#answer_process', visible: false).set(nil)
        click_button '登録'
        expect(page).to have_content 'プロセスを入力してください'
      end
    end

    context 'フォームの入力値が正常' do
      it '解答の登録に成功' do
        # 遷移されたページに'User was successfully created.'の文字列があることを期待する
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set('Answer')
        find('#answer_process', visible: false).set('Answer_process')
        click_button '登録'
        expect(page).to have_content '解答の登録に成功しました'
      end

      it 'テスト日の登録に失敗' do
        expect(page).to have_content 'さ'
        click_button 'さ'
        click_link 'ジャンル'
        find(".createQ").double_click
        expect(page).to have_content 'Q.'
        find('#question_statement', visible: false).set('テスト作成')
        click_button '登録'
        expect(page).to have_content '問題の登録に成功しました'
        find('#answer_solution', visible: false).set('Answer')
        find('#answer_process', visible: false).set('Answer_process')
        click_button '登録'
        expect(page).to have_content '解答の登録に成功しました'
        find('#answer_exam', visible: false).set('2010/03/01')
        click_button '登録'
        expect(page).to have_content ''
      end
    end
  end
end