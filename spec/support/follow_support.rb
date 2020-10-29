module FollowSupport
  def follow(user)
    schedule_registration(user)
    click_on('ユーザー検索')
    another_user = FactoryBot.build(:user)
    another_user.name = 'テスト'
    another_user.email = 'test@123'
    another_user.password = '123abc'
    another_user.password_confirmation = '123abc'
    another_user.search_number = 22_222_222
    another_user.save
    fill_in 'keyword', with: another_user.search_number
    click_on('検索')
    click_on("#{another_user.name}さんのページへ")
    expect do
      find('a[rel="nofollow"]').click
    end.to change { Follow.count }.by(1)
  end
end
