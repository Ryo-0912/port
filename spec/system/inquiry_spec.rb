require 'rails_helper'

RSpec.describe 'お問い合わせの投稿', type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:admin){ FactoryBot.create(:admin) }

  before do
    admin
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: 'test123'
    click_button 'ログイン'
    # ジャンル画面へ遷移
    expect(page).to have_content 'My Nort'
  end

  describe 'Inquiry' do
    context 'フォームの入力値が正常' do
      it 'お問い合わせの登録に成功' do
        find(".admin").click
        expect(page).to have_content 'お問い合わせフォーム'
        fill_in "inquiry[email]", with: user.email
        fill_in "inquiry[message]", with: 'お問い合わせ'
        click_button '送信'
        expect(page).to have_content 'My Nort'
      end
    end

    context 'フォームの入力値が異常' do
      it 'メールアドレスが不適切' do
        find(".admin").click
        expect(page).to have_content 'お問い合わせフォーム'
        fill_in "inquiry[email]", with: nil
        fill_in "inquiry[message]", with: 'お問い合わせ'
        click_button '送信'
        expect(page).to have_content 'メールアドレスを入力してください'
      end

      it 'お問い合わせフォームが不適切' do
        find(".admin").click
        expect(page).to have_content 'お問い合わせフォーム'
        fill_in "inquiry[email]", with: user.email
        fill_in "inquiry[message]", with: nil
        click_button '送信'
        expect(page).to have_content 'お問い合わせ内容を入力してください'
      end
    end
  end
end