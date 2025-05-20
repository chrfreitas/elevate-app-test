require 'jwt'

module Authentication::Token
  SECRET_KEY = 'blabla'

  def self.encode(payload,  exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end
end
