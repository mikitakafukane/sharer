class Post < ApplicationRecord
  
  belongs_to :user
  has_many :likes,    dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
