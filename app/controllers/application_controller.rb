class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    set_user

    header_token = request.headers['auth-token']

    if header_token.present?
      token_is_equal?(header_token)
    else
      render json: { token: 'Missing token' }
    end
  end

  def token_is_equal?(header_token)
    if header_token == @user.token
      @user
    else
      render json: { token: 'Invalid token' }
    end
  end

  def set_user
    @user = User.find(params[:user_id] || params[:id])
  end
end
