class Review < ApplicationRecord
  belongs_to :product, foreign_key: 'product_id'
  belongs_to :user, foreign_key: 'user_id'

  validates_presence_of :product_id, :user_id, :content, :rating
end
