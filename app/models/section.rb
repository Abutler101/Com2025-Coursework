class Section < ApplicationRecord
  has_many :products, dependent: :destroy
end
