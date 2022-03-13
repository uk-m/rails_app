class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :delete_all
  has_many :likes, -> { order(created_at: :desc) }, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations
  
  validates :content, presence: true, length: { maximum: 140 }
  
  accepts_nested_attributes_for :photos
  
  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
