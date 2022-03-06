class ApplicationController < ActionController::API

  private
  def authenticate
    auth_header = request.headers['Authorization'].split(' ')[1]

    @user ||= AuthenticationServices::AuthenticatedUserReader.call(token: auth_header)
    if @user
      return true
    else
      render json: { message: 'Invalid Credentials' }, status: :unauthorized
    end
  end
end
