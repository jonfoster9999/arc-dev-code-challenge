class AccessToken < ApplicationRecord
  belongs_to :user
  TTL = 10.minutes

  def self.create_for_user(user)
    user_info = UserSerializer.new(user).as_json
    create(
      token_value: JWT.encode(
        user_info.merge({exp: Time.now.to_i + TTL}),
        ENV['JWT_SECRET']
      ),
      user_id: user.id
    )
  end
end
