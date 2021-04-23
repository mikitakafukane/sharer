class Post < ApplicationRecord
  
  belongs_to :user
  has_many :likes,    dependent: :destroy
  has_many :like_users, through: :likes,       source: :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  
  validates :content, presence: true

  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
