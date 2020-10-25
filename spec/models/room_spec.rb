require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'association' do

    it 'messageアソシエーション' do
      t = Room.reflect_on_association(:messages) 
      expect(t.macro).to eq(:has_many) 
    end

    it 'entryアソシエーション' do
      t = Room.reflect_on_association(:entries) 
      expect(t.macro).to eq(:has_many) 
    end

    it 'notificationアソシエーション' do
      t = Room.reflect_on_association(:notifications) 
      expect(t.macro).to eq(:has_many) 
    end
  end
end
