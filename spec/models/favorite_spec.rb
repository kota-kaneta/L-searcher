require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'association' do

    it 'makedアソシエーション' do
      t = Favorite.reflect_on_association(:maked)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'passive_notificationアソシエーション' do
      t = Favorite.reflect_on_association(:making)
      expect(t.macro).to eq(:belongs_to)
    end

  end
end
