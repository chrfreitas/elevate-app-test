require 'jwt'

module Helpers::Token
  def self.encode(payload,  exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV["TOKEN_SECRET_KEY"])
  end

  def self.decode(token)
    return nil if token.nil?

    JWT.decode(token, ENV["TOKEN_SECRET_KEY"]).first
  end
end
