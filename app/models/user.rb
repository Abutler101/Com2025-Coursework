# Represents a user account - Uses Bcrypt to authenticate
#                           - 1 user can leave many reviews, which will get removed when the user closes their account
#                           - 1 user can place many orders, which will get deleted when the account is closed
#                           - Only one account per email address allowed.
#                           - A user must provide their name and email address to have an account
class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates_presence_of :firstName, :lastName, :email
  validates :email, uniqueness: true
end
