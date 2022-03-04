class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :delete_all
  has_many :posts, through: :post_tag_relations
end
