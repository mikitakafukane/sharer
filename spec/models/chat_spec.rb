require 'rails_helper'

RSpec.describe Chat, type: :model do
  describe 'バリデーションのテスト' do
    subject { chat.valid? }

    let(:user) { build(:user) }
    let(:room) { build(:room) }
    let(:chat) { build(:chat, user_id: user.id, room_id: room.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        chat.content = ''
        expect(chat.valid?).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }

      it '1:Nとなっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
    
    context 'Roomモデルとの関係' do
      let(:target) { :room }

      it '1:Nとなっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end