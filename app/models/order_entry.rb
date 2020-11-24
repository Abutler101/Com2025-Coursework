# Represent a single product in an order - Many order entries belong to 1 order
#                                        - 1 order entry holds info on 1 product
class OrderEntry < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates_presence_of :quantity, :unitprice, :product_id, :order_id
end
