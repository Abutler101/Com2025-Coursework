# Represents a review of a product - Many reviews can belong to 1 product
#                                 - Many reviews can be left by 1 user
#                                 - to exist a review must be complete and associated with a user and product
class Review < ApplicationRecord
  belongs_to :product, foreign_key: 'product_id'
  belongs_to :user, foreign_key: 'user_id'

  validates_presence_of :product_id, :user_id, :content, :rating
end
