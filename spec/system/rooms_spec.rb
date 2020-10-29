require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ルームを作成したとき' do
    it 'フォロー後、DMを送るためのルームを作成できること' do
      # ユーザーをフォローする
      follow(@user)

      # ルームを作成するとDBに保存されている
      expect do
        click_on('DMルーム作成')
      end.to change { Room.count }.by(1)

      # 相手とのルームページに遷移している
      expect(page).to have_content('参加者')
    end
  end

  context 'ルーム作成後' do
    it 'ルーム一覧に表示されていること' do
      # ユーザーをフォローする
      follow(@user)

      # ルームを作成する
      click_on('DMルーム作成')

      # トップページに遷移する
      visit root_path

      # ルーム一覧ページへ遷移する
      click_on('ルーム一覧')

      # 先ほど作成したルームが表示されている
      expect(page).to have_content('テストのルーム')
    end
  end
end
