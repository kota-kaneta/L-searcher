module DmSupport
  def direct_message(user)
    click_on('DMルーム作成')
    @message = FactoryBot.build(:message)
    fill_in 'message[content]', with: @message
    click_on('送信')
  end
end