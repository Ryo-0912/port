require 'rails_helper'

RSpec.describe '問題の新規登録', type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:admin){ id '2' }

  before do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: 'test123'
    click_button 'ログイン'
    # ジャンル画面へ遷移
    expect(page).to have_content 'My Note'
  end

  describe 'Inquiry' do
    context 'フォームの入力値が正常' do
      it 'お問い合わせの登録に成功' do
        find(".admin").click
        expect(page).to have_content 'お問い合わせフォーム'
        fill_in "inquiry[email]", with: user.email
        fill_in "inquiry[message]", with: 'お問い合わせ'
        click_button '送信'
      end

    end
  end
end