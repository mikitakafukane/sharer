require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do
    subject { task.valid? }

    let(:user) { build(:user) }
    let(:task) { build(:task, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        task.title = ''
        expect(task.valid?).to eq false
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