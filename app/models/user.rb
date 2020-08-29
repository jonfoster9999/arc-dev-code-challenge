class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :access_tokens
  has_many :refresh_tokens
  has_many :ideas
end
