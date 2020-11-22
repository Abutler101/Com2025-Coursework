# Represent a placed order- many orders belong to 1 user
#                         - 1 order can have many order entries
#                         - Order entries can't exist without an order and an order can't exist without a user to own it
#                         - Must have an owner, a total cost and a billing contact email (can be different to the email of the user)
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_entries, dependent: :destroy
  validates_presence_of :user_id, :totalCost, :email
end
