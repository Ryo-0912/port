require 'rails_helper'

RSpec.describe 'お知らせ機能', type: :system do
  let(:user){ FactoryBot.create(:user) }
  let(:admin){ FactoryBot.create(:admin) }

  before do
    admin
    visit login_path
    fill_in "email", with: admin.email
    fill_in "password", with: 'admin123'
    click_button 'ログイン'
    # ジャンル画面へ遷移
    expect(page).to have_content 'My Note'
  end

  describe 'Inquiry' do
    context '新着のお問い合わせがある' do
      it '鈴マークがある' do
        find(".admin").click
        expect(page).to have_css('.far fa-bell')
      end
    end

    context '新着のお問い合わせがない' do
      it '鈴マークがない' do
        find(".admin").click
        expect(page).to have_content '通知一覧'
      end
    end
  end
end