require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'association' do
    
    it 'messageアソシエーション' do
      t = Notification.reflect_on_association(:message) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'roomアソシエーション' do
      t = Notification.reflect_on_association(:room) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'visitorアソシエーション' do
      t = Notification.reflect_on_association(:visitor) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'visitedアソシエーション' do
      t = Notification.reflect_on_association(:visited) 
      expect(t.macro).to eq(:belongs_to) 
    end
  end
end