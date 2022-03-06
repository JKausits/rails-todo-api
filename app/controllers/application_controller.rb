class ApplicationController < ActionController::API

  private
  def authenticate
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ')[1] if auth_header.present?
    @user ||= AuthenticationServices::AuthenticatedUserReader.call(token: token)
    if @user
      return true
    else
      render json: { message: 'Invalid Credentials' }, status: :unauthorized
    end
  end
end
