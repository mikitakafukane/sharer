class Room < ApplicationRecord
  has_many :belongings
  has_many :chats
  has_many :users, through: :belongings
end
