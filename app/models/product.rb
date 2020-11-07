class Product < ApplicationRecord
  belongs_to :section
  has_many :reviews, -> {order(created_at: :desc)}
  monetize :pricePence, as: "price", numericality: true
  mount_uploader :image, ProductImgUploader
  validates_presence_of :name, :price, :stockCount, :section
end
