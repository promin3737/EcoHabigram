class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  attachment :profile_image

  has_many :likes
  has_many :comments
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users

  validates :name, presence: true, length: { maximum: 50 }
end
