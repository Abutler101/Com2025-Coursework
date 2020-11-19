class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates_presence_of :firstName, :lastName, :email
  validates :email, uniqueness: true
end
