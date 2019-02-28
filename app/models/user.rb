class User < ApplicationRecord
  has_many :events

  validates :name, presence:true, length: {maximum: 35}
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, email_format: true
end
