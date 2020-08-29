class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from StandardError, with: :show_errors

  def show_errors(exception)
    render json: exception, status: 422
  end

  private

  def access_token
    return nil unless auth_header.is_a? String
    @access_token ||= auth_header
  end

  def auth_header
    request.headers['x-access-token']
  end

  def authenticate!
    begin
      token = AccessToken.find_by(token_value: access_token)
      if !token
        return render({json: { error: 'invalid token'}, status: 401})
      else
        JWT.decode(token.token_value, ENV['JWT_SECRET'])
        @current_user = token.user
      end
    rescue JWT::ExpiredSignature
      return render({json: { error: 'token has expired'}, status: 401})
    end
  end

  def current_user
    return @current_user if @current_user
    token = AccessToken.find_by(token_value: access_token)
    @current_user = token.user if token
  end
end
