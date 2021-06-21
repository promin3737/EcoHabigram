class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image

  def liked_by(user)
    # user_idとpost_image_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_image_id: id)
  end

  # has_many :likes, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  validates :user_id, uniqueness: { scope: :image_id }

  has_many :comments, dependent: :destroy
end
