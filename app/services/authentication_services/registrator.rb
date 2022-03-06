module AuthenticationServices
  class Registrator < ApplicationService
    attr_reader :email

    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      register_user
    end

    private
    def register_user
      User.create(email: email, password: @password)
    end
  end
end
