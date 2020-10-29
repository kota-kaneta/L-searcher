require 'rails_helper'

RSpec.describe 'Schedules', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  # 中略

  context '登録に成功したとき' do
    it 'スケジュールの登録に成功するとトップページにリンクが追加される' do
      # サインインする
      sign_in(@user)

      # 登録ページへ遷移する
      click_on('スケジュールを登録する')

      # 値をテキストフォームに入力する
      fill_in 'schedule[location]', with: '東京'

      # 送信した値がDBに保存されていることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Schedule.count }.by(1)

      # トップページに遷移していることを確認する
      expect(current_path).to eq root_path

      # リンクが追加されていることを確認する
      expect(page).to have_content('マイページ')
    end
  end

  context '登録に失敗したとき' do
    it 'スケジュールの失敗するとエラーが表示される' do
      # サインインする
      sign_in(@user)

      # 登録ページへ遷移する
      click_on('スケジュールを登録する')

      # 値を入力せず登録しようとする
      click_on('登録する')

      # ページ遷移がないことを確認する
      expect(page).to have_content('暇な時間帯を記入してください')
    end
  end
end
