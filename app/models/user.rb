class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :belongings
  has_many :chats
  has_many :rooms, through: :belongings

  has_many :posts
  has_many :likes
  has_many :like_posts,    through: :likes,    source: :post
  has_many :comments
  has_many :comment_posts, through: :comments, source: :post
  
  has_many :tasks

  attachment :image
end
