class AccessTokensController < ApplicationController
  before_action :authenticate!, only: [:me]

  def refresh
    refresh_token = RefreshToken.find_by(token_value: params[:refresh_token])
    begin
      if refresh_token
        decoded = JWT.decode(refresh_token.token_value, ENV['JWT_SECRET'])
        user_id = decoded[0]["id"]
        user = User.find_by(id: user_id)
        render json: TokenService.create_tokens_for_user(user)
      else
        render json: { error: 'Refresh token does not exist' }, status: 401
      end
    rescue JWT::ExpiredSignature
      render json: { error: 'Refresh token has expired' }, status: 401
    end
  end

  def sign_in
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      render json: TokenService.create_tokens_for_user(@user)
    else
      head :unauthorized
    end
  end

  def sign_out
    token = AccessToken.find_by(token_value: access_token)
    if token
      user = token.user
      TokenService.delete_all_tokens_for_user(user)
      head :no_content
    else
      render json: { error: 'invalid token' }, status: 404
    end
  end

  def me
    render json: current_user, status: 200
  end
end
