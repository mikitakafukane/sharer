# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

describe 'モデルのテスト' do
  it "有効なユーザーの場合は保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end

end