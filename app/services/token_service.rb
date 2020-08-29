class TokenService
  def self.create_tokens_for_user(user)
    {
      jwt: AccessToken.create_for_user(user).token_value,
      refresh_token: RefreshToken.create_for_user(user).token_value
    }
  end
end
