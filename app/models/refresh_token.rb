class RefreshToken < ApplicationRecord
  belongs_to :user
  TTL = 1.day

  def self.create_for_user(user)
    user_info = { id: user.id }
    create(
      token_value: JWT.encode(
        user_info.merge({exp: Time.now.to_i + TTL}),
        ENV['JWT_SECRET']
      ),
      user_id: user.id
    )
  end
end
