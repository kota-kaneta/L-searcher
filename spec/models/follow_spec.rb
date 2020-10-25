require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'association' do

    it 'followableアソシエーション' do
      t = Follow.reflect_on_association(:followable)
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'followerアソシエーション' do
      t = Follow.reflect_on_association(:follower)
      expect(t.macro).to eq(:belongs_to) 
    end
  end
end
