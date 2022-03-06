module AuthenticationServices
  class Login < ApplicationService
    attr_reader :email

    def initialize(email:, password:)
      @email = email
      @password = password
    end

    private
    def login
      user = User.find_by_email(email)

      user unless user.present? && user.authenticate(@password)
    end
  end
end
