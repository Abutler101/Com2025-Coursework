class User < ApplicationRecord
  validates_presence_of :firstName, :lastName, :email
  validates :email, uniqueness: true
end
