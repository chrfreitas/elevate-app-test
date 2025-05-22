require "jwt"



module AuthToken
  module_function

  class InvalidToken < StandardError; end
  class ExpiredToken < StandardError; end

  def encode(payload,  exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV["TOKEN_SECRET_KEY"])
  end

  def decode(token)
    return nil if token.nil?

    begin
      JWT.decode(token, ENV["TOKEN_SECRET_KEY"]).first
    rescue JWT::ExpiredSignature
      raise ExpiredToken, "Token has expired"
    rescue JWT::DecodeError
      raise InvalidToken, "Invalid token"
    end
  end
end
