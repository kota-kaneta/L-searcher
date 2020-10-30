require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
  end

  context 'お気に入り登録に成功したとき' do
    it 'ユーザーをお気に入りに登録することができる' do
      #ユーザーをフォローする
      follow(@user)

      #お気に入り登録をする
      click_on("お気に入りに登録")

      #トップページに遷移
      visit root_path

      #お気に入り一覧に追加されている
      click_on('★')
      expect(page).to have_content('テストさん')
    end
  end

  context 'お気に入り登録を解除したとき' do
    it 'ユーザーのお気に入り解除' do
      #ユーザーをフォローする
      follow(@user)

      #お気に入り登録をする
      click_on("お気に入りに登録")

      #お気に入りを解除する
      click_on('お気に入り解除')

      #トップページに遷移
      visit root_path

      #お気に入り一覧から表示がなくなっている
      click_on('★')
      expect(page).not_to have_content('テストさん')
    end
  end
end
