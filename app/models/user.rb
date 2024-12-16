# email: string
# password_digest:string

class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets

  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :password, presence: true, length: 6..50
end
