require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:user) { build(:user) }
    let(:post) { build(:post) }
    let(:comment) { build(:comment, user_id: user.id, post_id: post.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        comment.content = ''
        expect(comment.valid?).to eq false
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

    context 'Postモデルとの関係' do
      let(:target) { :post }

      it '1:Nとなっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end