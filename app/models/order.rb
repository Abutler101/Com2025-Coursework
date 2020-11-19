class Order < ApplicationRecord
  belongs_to :user
  has_many :order_entries, dependent: :destroy
  validates_presence_of :user_id, :totalCost, :email
end
