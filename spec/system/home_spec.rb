require 'rails_helper'

RSpec.describe 'Home' do
  it 'ホーム画面に必要事項が記入されている' do
    visit root_path
    expect(page).to have_content '新規登録'
    expect(page).to have_content 'ログイン'
    expect(page).to have_content '記憶ノート'
  end
end