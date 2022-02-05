require 'rails_helper'

RSpec.describe 'お知らせ機能', type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:admin){ FactoryBot.create(:admin) }

  describe 'Inquiry' do
    context '新着のお問い合わせがある' do
      it '鈴マークがある' do
        admin
        #ユーザーがログインして、お問い合わせメッセージ送信
        visit login_path
        fill_in "email", with: user.email
        fill_in "password", with: 'test123'
        click_button 'ログイン'
        expect(page).to have_content 'My Note'
        find(".admin").click
        expect(page).to have_content 'お問い合わせフォーム'
        fill_in "inquiry[email]", with: user.email
        fill_in "inquiry[message]", with: 'お問い合わせ'
        click_button '送信'
        expect(page).to have_content 'My Note'
        find(".logoutlink").click
        #adminユーザーがログイン
        visit login_path
        fill_in "email", with: admin.email
        fill_in "password", with: 'admin123'
        click_button 'ログイン'
        expect(page).to have_content 'My Note'
        find(".admin").click
        expect(page).to have_css('.far')
      end
    end

    context '新着のお問い合わせがない' do
      it '鈴マークがない' do
        visit login_path
        fill_in "email", with: admin.email
        fill_in "password", with: 'admin123'
        click_button 'ログイン'
        expect(page).to have_content 'My Note'
        find(".admin").click
        expect(page).to have_content '通知一覧'
      end
    end
  end
end