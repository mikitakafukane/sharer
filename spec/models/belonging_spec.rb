require 'rails_helper'

RSpec.describe Belonging, type: :model do

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
    
    context 'Userモデルとの関係' do
      let(:target) { :room }

      it '1:Nとなっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end