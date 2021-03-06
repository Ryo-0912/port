require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :system do
  let(:user){ FactoryBot.create(:user) }

  describe '通常画面' do
    describe 'ログイン' do
      context '認証情報が正しい場合' do
        it 'ログインできること' do
          visit login_path
          fill_in 'email', with: user.email
          fill_in 'password', with: 'test123'
          click_button 'ログイン'
          expect(page).to have_content 'My Nort'
        end
      end

      context 'mailに誤りがある場合' do
        it 'ログインできないこと' do
          visit login_path
          fill_in 'email', with: 'zzz@example.com'
          fill_in 'password', with: 'test123'
          click_button 'ログイン'
          expect(page).to have_current_path("/login")
        end
      end

      context 'PWに誤りがある場合' do
        it 'ログインできないこと' do
          visit login_path
          fill_in 'email', with: user.email
          fill_in 'password', with: '123456'
          click_button 'ログイン'
          expect(page).to have_current_path("/login")
        end
      end
    end
  end
end