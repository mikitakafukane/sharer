class Post < ApplicationRecord
  
  belongs_to :user
  has_many :likes
  has_many :comments
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
