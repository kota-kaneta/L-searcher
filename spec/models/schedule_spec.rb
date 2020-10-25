require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '#create' do
    before do
      @schedule = FactoryBot.build(:schedule)
    end

    it "すべてのカラムが存在すれば登録できること" do
      expect(@schedule).to be_valid
    end

    it "locationが空だと登録できないこと" do
      @schedule.location = nil
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("Locationを入力してください", "Locationは不正な値です")
    end

    it "locationは全角ひらがな、カタカナ、漢字でないと登録できないこと（半角数字のとき）" do
      @schedule.location = 111
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("Locationは不正な値です")
    end

    it "locationは全角ひらがな、カタカナ、漢字でないと登録できないこと（半角英字のとき）" do
      @schedule.location = "aaa"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("Locationは不正な値です")
    end

    # 数値のとき

    it "from_time_sunは24以下の整数でないと登録できないこと" do
      @schedule.from_time_sun = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time sunは25より小さい値にしてください")
    end

    it "from_time_monは24以下の整数でないと登録できないこと" do
      @schedule.from_time_mon = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time monは25より小さい値にしてください")
    end

    it "from_time_tueは24以下の整数でないと登録できないこと" do
      @schedule.from_time_tue = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time tueは25より小さい値にしてください")
    end

    it "from_time_wedは24以下の整数でないと登録できないこと" do
      @schedule.from_time_wed = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time wedは25より小さい値にしてください")
    end

    it "from_time_thuは24以下の整数でないと登録できないこと" do
      @schedule.from_time_thu = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time thuは25より小さい値にしてください")
    end

    it "from_time_friは24以下の整数でないと登録できないこと" do
      @schedule.from_time_fri = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time friは25より小さい値にしてください")
    end

    it "from_time_satは24以下の整数でないと登録できないこと" do
      @schedule.from_time_sat = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time satは25より小さい値にしてください")
    end

    it "to_time_sunは24以下の整数でないと登録できないこと" do
      @schedule.to_time_sun = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time sunは25より小さい値にしてください")
    end

    it "to_time_monは24以下の整数でないと登録できないこと" do
      @schedule.to_time_mon = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time monは25より小さい値にしてください")
    end

    it "to_time_tueは24以下の整数でないと登録できないこと" do
      @schedule.to_time_tue = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time tueは25より小さい値にしてください")
    end

    it "to_time_wedは24以下の整数でないと登録できないこと" do
      @schedule.to_time_wed = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time wedは25より小さい値にしてください")
    end

    it "to_time_thuは24以下の整数でないと登録できないこと" do
      @schedule.to_time_thu = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time thuは25より小さい値にしてください")
    end

    it "to_time_friは24以下の整数でないと登録できないこと" do
      @schedule.to_time_fri = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time friは25より小さい値にしてください")
    end

    it "to_time_satは24以下の整数でないと登録できないこと" do
      @schedule.to_time_sat = "25"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time satは25より小さい値にしてください")
    end

    # 文字列のとき

    it "from_time_sunは24以下の整数でないと登録できないこと" do
      @schedule.from_time_sun = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time sunは数値で入力してください")
    end

    it "from_time_monは24以下の整数でないと登録できないこと" do
      @schedule.from_time_mon = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time monは数値で入力してください")
    end

    it "from_time_tueは24以下の整数でないと登録できないこと" do
      @schedule.from_time_tue = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time tueは数値で入力してください")
    end

    it "from_time_wedは24以下の整数でないと登録できないこと" do
      @schedule.from_time_wed = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time wedは数値で入力してください")
    end

    it "from_time_thuは24以下の整数でないと登録できないこと" do
      @schedule.from_time_thu = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time thuは数値で入力してください")
    end

    it "from_time_friは24以下の整数でないと登録できないこと" do
      @schedule.from_time_fri = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time friは数値で入力してください")
    end

    it "from_time_satは24以下の整数でないと登録できないこと" do
      @schedule.from_time_sat = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("From time satは数値で入力してください")
    end

    it "to_time_sunは24以下の整数でないと登録できないこと" do
      @schedule.to_time_sun = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time sunは数値で入力してください")
    end

    it "to_time_monは24以下の整数でないと登録できないこと" do
      @schedule.to_time_mon = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time monは数値で入力してください")
    end

    it "to_time_tueは24以下の整数でないと登録できないこと" do
      @schedule.to_time_tue = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time tueは数値で入力してください")
    end

    it "to_time_wedは24以下の整数でないと登録できないこと" do
      @schedule.to_time_wed = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time wedは数値で入力してください")
    end

    it "to_time_thuは24以下の整数でないと登録できないこと" do
      @schedule.to_time_thu = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time thuは数値で入力してください")
    end

    it "to_time_friは24以下の整数でないと登録できないこと" do
      @schedule.to_time_fri = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time friは数値で入力してください")
    end

    it "to_time_satは24以下の整数でないと登録できないこと" do
      @schedule.to_time_sat = "ああ"
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include("To time satは数値で入力してください")
    end
  end

  describe 'association' do

    it 'userアソシエーション' do
      t = Schedule.reflect_on_association(:user) 
      expect(t.macro).to eq(:belongs_to) 
    end
  end
end
