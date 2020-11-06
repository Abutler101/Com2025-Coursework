class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :productID, :userID, :content, :rating
end
