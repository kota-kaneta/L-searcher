require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'association' do

    it 'userアソシエーション' do
      t = Entry.reflect_on_association(:user) 
      expect(t.macro).to eq(:belongs_to) 
    end

    it 'roomアソシエーション' do
      t = Entry.reflect_on_association(:room) 
      expect(t.macro).to eq(:belongs_to) 
    end
  end
end
