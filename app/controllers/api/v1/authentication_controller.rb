class Api::V1::AuthenticationController < ApplicationController

  def register
    user = AuthenticationServices::Registrator.call(email: params['email'], password: params['password'])
    token = AuthenticationServices::UserTokenCreator.call(user: user)

    render json: { token: token }, status: :created
  end

  def login
    user = AuthenticationServices::Login.call(email: params['email'], password: params['password'])
    if user.present?
      token = AuthenticationServices::UserTokenCreator.call(user: user)
      render json: { token: token }
    else
      render json: { message: 'Invalid Credentials' }, status: :unauthorized
    end
  end

end
