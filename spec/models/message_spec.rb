require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'contentが空だと保存できないこと' do
      @message.content = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Contentを入力してください")
    end

    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Roomを入力してください")
    end

    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Userを入力してください")
    end
  end

  describe 'association' do

    it 'userアソシエーション' do
      t = Message.reflect_on_association(:user) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'roomアソシエーション' do
      t = Message.reflect_on_association(:room) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'notificationアソシエーション' do
      t = Message.reflect_on_association(:notifications) 
      expect(t.macro).to eq(:has_many) 
    end
  end
end