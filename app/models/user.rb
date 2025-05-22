class User < ApplicationRecord
  has_many :game_events

  has_secure_password

  VALID_PASSWORD_REGEX = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[[:^alnum:]])[\w[:^alnum:]]{8,}$/
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX, message: "is invalid" }

  validates :password, format: {
    with: VALID_PASSWORD_REGEX,
    message: "must one uppercase letter, one lowercase letter, one number, and one special symbol (like !, @, or #).",
    multiline: true
  }, allow_nil: true
end
