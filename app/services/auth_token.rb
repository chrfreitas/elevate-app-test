require "jwt"

module AuthToken
  module_function

  def encode(payload,  exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV["TOKEN_SECRET_KEY"])
  end

  def decode(token)
    return nil if token.nil?

    JWT.decode(token, ENV["TOKEN_SECRET_KEY"]).first
  end
end
