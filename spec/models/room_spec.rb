require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'バリデーションのテスト' do
    subject { room.valid? }

    let(:user) { build(:user) }
    let(:room) { build(:room, user_ids: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        room.name = ''
        expect(room.valid?).to eq false
      end
    end
    
    context 'user_idsカラム' do
      it '空欄でないこと' do
        room.user_ids = ''
        expect(room.valid?).to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    
    context 'Userモデルとの関係' do
      let(:target) { :users }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    
    context 'Belongingモデルとの関係' do
      let(:target) { :belongings }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
    
    context 'Chatモデルとの関係' do
      let(:target) { :chats }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end