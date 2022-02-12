class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 140 }
  
  accepts_nested_attributes_for :photos
  
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
