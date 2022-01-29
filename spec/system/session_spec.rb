require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '通常画面' do
    describe 'ログイン' do
      context '認証情報が正しい場合' do
        it 'ログインできること' do
          visit login_path
          fill_in 'email', with: @user.email
          fill_in 'password', with: @user.password
          click_button 'ログイン'
          expect(current_path).to eq genres_path
        end
      end

      context 'mailに誤りがある場合' do
        it 'ログインできないこと' do
          visit login_path
          fill_in 'email', with: 'zzz@example.com'
          fill_in 'password', with: @user.password
          click_button 'ログイン'
          expect(current_path).to eq login_path
        end
      end

      context 'PWに誤りがある場合' do
        it 'ログインできないこと' do
          visit login_path
          fill_in 'email', with: @user.email
          fill_in 'password', with: '1234'
          click_button 'ログイン'
          expect(current_path).to eq login_path
        end
      end
    end
  end
end