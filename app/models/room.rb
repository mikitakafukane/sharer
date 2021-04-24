class Room < ApplicationRecord
  has_many :belongings
  has_many :chats
  has_many :users, through: :belongings
  
  accepts_nested_attributes_for :belongings
  
  validates :name, presence: true
  validates :user_ids, presence: true
end
