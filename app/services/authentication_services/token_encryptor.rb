module AuthenticationServices
  class TokenEncryptor < TokenServiceBase
    attr_reader :payload
    def initialize(payload:)
      @payload = payload
    end

    def call
      encrypt_payload
    end

    private
    def encrypt_payload
      JWT.encode payload, SECRET, HASHING_ALGORITHM
    end
  end
end
