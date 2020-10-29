require 'rails_helper'

RSpec.describe 'Follows', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'フォローに成功したとき' do
    it 'ユーザーIDを用いてフォローすることができる' do
      # サインインし、スケジュールを登録する
      schedule_registration(@user)

      # ユーザー検索ページに遷移する
      click_on('ユーザー検索')

      # 検索フォームに他人のユーザーIDを入力し、検索する
      another_user = FactoryBot.build(:user)
      another_user.name = 'テスト'
      another_user.email = 'test@123'
      another_user.password = '123abc'
      another_user.password_confirmation = '123abc'
      another_user.search_number = 22_222_222
      another_user.save
      fill_in 'keyword', with: another_user.search_number
      click_on('検索')

      # 詳細ページへ遷移する
      click_on("#{another_user.name}さんのページへ")

      # フォローが成功したらリンクが変更される
      expect do
        find('a[rel="nofollow"]').click
      end.to change { Follow.count }.by(1)
    end
  end

  context 'フォロー解除に成功したとき' do
    it 'フォローしているユーザーはフォロー解除することができる' do
      # フォローする
      follow(@user)

      # フォロー解除するとリンクが変更される
      click_on('フォローを解除する')
      expect(page).to have_content('フォローする')
    end
  end
end
