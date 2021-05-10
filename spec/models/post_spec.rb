require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { build(:user) }
    let(:post) { build(:post, user_id: user.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        post.content = ''
        expect(post.valid?).to eq false
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

    context 'Likeモデルとの関係' do
      let(:target) { :likes }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      let(:target) { :comments }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end