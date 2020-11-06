class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :firstName, :lastName, :email
  validates :email, uniqueness: true
end
