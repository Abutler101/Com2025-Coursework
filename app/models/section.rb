# Represents a section of the store of similar products - 1 section can have many products
#                                                       - Products are not allowed to exist if they don't have section
class Section < ApplicationRecord
  has_many :products, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name
end
