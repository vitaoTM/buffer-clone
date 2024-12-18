class TwitterAccount < ApplicationRecord
  has_many :tweets, dependent: :destroy
  belongs_to :user
  validates :username, uniqueness: true
end
