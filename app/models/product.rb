# Represents a prdouct that is listed in the store - Many products belong to 1 section
#                                                  - A product can only be a part of 1 section
#                                                  - 1 product has Many reviews, these reviews can't exist without the
#                                                    product
#                                                  - Price is stored in pence then gem takes care of converting to local
#                                                    currency and displaying with correct symbol
#                                                  - Must have a name, price stock count and be linked to a product section
class Product < ApplicationRecord
  belongs_to :section
  has_many :reviews, -> {order(created_at: :desc)}, dependent: :destroy
  monetize :pricePence, as: "price", numericality: true
  mount_uploader :image, ProductImgUploader
  validates_presence_of :name, :price, :stockCount, :section
end
