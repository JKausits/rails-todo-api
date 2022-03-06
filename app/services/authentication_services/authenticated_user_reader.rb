module AuthenticationServices
  class AuthenticatedUserReader < ApplicationService
    attr_reader :token
    def initialize(token:)
      @token = token
    end

    def call
      read_user
    end

    private
    def read_user
      decoded_data = TokenDecryptor.call(token: token)
      user_id = decoded_data[0]["user_id"] unless decoded_data.nil?
      User.find(user_id) unless user_id.nil?
    end
  end
end
