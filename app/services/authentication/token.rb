require 'jwt'

module Authentication::Token
  def self.encode(payload,  exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV["SECRET_KEY"])
  end

  def self.decode(token)
    JWT.decode(token, ENV["SECRET_KEY"]).first
  end
end
