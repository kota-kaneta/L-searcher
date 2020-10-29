require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'メッセージの送信に成功したとき' do
    it 'ルーム内でDMの送信が成功したとき' do
      # DMルームへ遷移
      follow(@user)
      click_on('DMルーム作成')

      # メッセージを入力する
      @message = FactoryBot.build(:message)
      fill_in 'message[content]', with: @message

      # メッセージを送信するとDBに保存される
      expect  do
        find('input[name="commit"]').click
      end.to change { Message.count }.by(1)

      # メッセージを送信するとルームに表示されている
      expect(page).to have_content(@message)
    end

    it 'ルーム内でDMの送信が失敗したとき' do
      # DMルームへ遷移
      follow(@user)
      click_on('DMルーム作成')

      # メッセージが空のまま送信しようとする
      @message = FactoryBot.build(:message)
      @message = nil

      # メッセージが保存されていないこと
      expect do
        find('input[name="commit"]').click
      end.to change { Message.count }.by(0)
    end
  end
end
