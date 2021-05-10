require 'rails_helper'

RSpec.describe Like, type: :model do

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