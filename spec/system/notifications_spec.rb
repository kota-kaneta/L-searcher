require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'フォロー通知の確認' do
    it 'ユーザーからのフォロー、DMによる通知が来る' do
      # ユーザーをフォローし、DMルームでメッセージ送信
      follow(@user)
      direct_message(@user)

      # ログアウト
      visit root_path
      click_on('ログアウト')

      # フォロー先のユーザーでログイン
      visit root_path
      fill_in 'user[email]', with: 'test@123'
      fill_in 'user[password]', with: '123abc'
      click_on('ログインする')

      # スケジュールを登録する
      click_on('スケジュールを登録する')
      fill_in 'schedule[location]', with: '東京'
      click_on('登録する')

      # 通知一覧ページへ遷移する
      click_on('通知')

      # 通知ページに@userから受け取った通知が表示されている
      expect(page).to have_content('あなたをフォローしました')
      expect(page).to have_content('DMが届きました')
    end
  end
end
