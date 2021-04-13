class Room < ApplicationRecord
  has_many :belongings
  has_many :chats
end
