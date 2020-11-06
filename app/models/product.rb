class Product < ApplicationRecord
  belongs_to :section

  validates_presence_of :name, :pricePence, :stockCount, :section
end
