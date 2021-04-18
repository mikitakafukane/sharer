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

  attachment :image

  has_many :creater_tasks,  class_name: 'Task', foreign_key: 'creater_id',   dependent: :destroy
  has_many :performer_tasks, class_name: 'Task', foreign_key: 'performer_id', dependent: :destroy
end
