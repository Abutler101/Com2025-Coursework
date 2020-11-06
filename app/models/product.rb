class Product < ApplicationRecord
  belongs_to :section
  has_many :reviews, -> {order(created_at: :desc)}
  validates_presence_of :name, :pricePence, :stockCount, :section
end
