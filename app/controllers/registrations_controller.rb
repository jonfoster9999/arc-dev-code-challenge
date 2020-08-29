class RegistrationsController < ApplicationController
  def sign_up
    @user = User.new(user_params)
    if @user.save
      render json: TokenService.create_tokens_for_user(@user)
    else
      render json: { error: "There was a problem creating the user: #{@user.errors.full_messages.join(', ')}"}, :status => 422
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end
end
