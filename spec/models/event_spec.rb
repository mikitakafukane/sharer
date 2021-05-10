require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'バリデーションのテスト' do
    subject { event.valid? }

    let(:user) { build(:user) }
    let(:event) { build(:event, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        event.title = ''
        expect(event.valid?).to eq false
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
  end
end