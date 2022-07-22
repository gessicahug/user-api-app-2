class V1::PasswordsController < ApplicationController
  def update
    if @user.update(password_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.permit(:password)
  end
end
