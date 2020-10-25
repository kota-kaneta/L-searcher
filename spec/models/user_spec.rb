require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmation、search_numberが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "search_numberが空では登録できないこと" do
      @user.search_number = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDを入力してください")
    end

    it "nameは全角ひらがな、カタカナ、漢字でないと登録できないこと（ローマ字の場合）" do
      @user.name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it "nameは全角ひらがな、カタカナ、漢字でないと登録できないこと（数字の場合）" do
      @user.name = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "emailは@がついていないと登録できないこと" do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123abc"
      @user.password_confirmation = "123abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordは半角数字のみでは登録が出来ないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordは半角英字のみでは登録が出来ないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "search_numberは半角数字のみでないと登録できないこと" do
      @user.search_number = "1234abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDは不正な値です")
    end

    it "search_numberは8文字でないと登録できないこと（7文字以下のとき）" do
      @user.search_number = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDは不正な値です")
    end

    it "search_numberは8文字でないと登録できないこと（9文字以上のとき）" do
      @user.search_number = "123456789"
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDは不正な値です")
    end

    it "重複したsearch_numberが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, search_number: @user.search_number)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("ユーザーIDはすでに存在します")
    end
  end

  describe 'association' do

    it 'scheduleアソシエーション' do
      t = User.reflect_on_association(:schedule) 
      expect(t.macro).to eq(:has_one) 
    end
    
    it 'messageアソシエーション' do
      t = User.reflect_on_association(:messages) 
      expect(t.macro).to eq(:has_many)
    end

    it 'entryアソシエーション' do
      t = User.reflect_on_association(:entries) 
      expect(t.macro).to eq(:has_many)
    end

    it 'active_notificationアソシエーション' do
      t = User.reflect_on_association(:active_notifications) 
      expect(t.macro).to eq(:has_many)
    end

    it 'passive_notificationアソシエーション' do
      t = User.reflect_on_association(:passive_notifications) 
      expect(t.macro).to eq(:has_many)
    end

    it 'sns_credentialsアソシエーション' do
      t = User.reflect_on_association(:sns_credentials) 
      expect(t.macro).to eq(:has_many)
    end
  end
end