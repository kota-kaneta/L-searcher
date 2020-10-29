require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  
  describe 'association' do
    it 'usersアソシエーション' do
     t = SnsCredential.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
  end

end
