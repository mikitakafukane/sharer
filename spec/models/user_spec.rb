# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'モデルのテスト' do
    it "有効なユーザーの場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  describe "空白のバリデーションテスト" do
    subject { user.valid? }

    let(:user) { build(:user) }

    context "nameカラム" do
      it "空欄でないこと" do
        user.name = ""
        is_expected.to eq false
      end
    end
  end

  describe "アソシエーションのテスト" do
    # context "Belongingモデルとの関係" do
    #   it "1:Nとなっている" do
    #     expect(User.reflect_on_association(:belongings).macro).to eq :has_many
    #   end
    # end
    
    context "Chatモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end
    
    context "Commentモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    
    context "Contactモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:contacts).macro).to eq :has_many
      end
    end
    
    context "Eventモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    
    context "Likeモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    
    context "Postモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    
    context "Roomモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:rooms).macro).to eq :has_many
      end
    end

    context "Taskモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:tasks).macro).to eq :has_many
      end
    end

    
    
    
  end
end