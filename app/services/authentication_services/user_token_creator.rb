module AuthenticationServices
class UserTokenCreator < ApplicationService
  def initialize(user:)
    @user = user
  end

  def call
    generate_token
  end

  private
  def generate_token
    AuthenticationServices::TokenEncryptor.call(payload: {
      'user_id' => @user.id,
      'email' => @user.email
    })
  end
end
end
