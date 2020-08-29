class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true

  has_many :access_tokens
  has_many :refresh_tokens
  has_many :ideas

  def avatar_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
