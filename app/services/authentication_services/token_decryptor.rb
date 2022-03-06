module AuthenticationServices
  class TokenDecryptor < TokenServiceBase
    attr_reader :token
    def initialize(token:)
      @token = token
    end

    def call
      decrypt_payload
    end

    private
    def decrypt_payload
      JWT.decode token, SECRET, true, { algorithm: HASHING_ALGORITHM }
    rescue
    end
  end
end
