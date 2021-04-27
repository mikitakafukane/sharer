class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :confirmable

  validates :name, presence: true

  has_many :belongings
  has_many :chats
  has_many :rooms, through: :belongings

  has_many :posts
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  has_many :comments
  has_many :comment_posts, through: :comments, source: :post

  has_many :tasks

  attachment :image

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.current_sign_in_at = Time.now
    end
  end
  
  def after_confirmation
    ThanksMailer.send_confirm_to_user(self).deliver
  end
end
