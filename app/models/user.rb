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
    message: "must include: 1 uppercase, 1 lowercase, 1 digit and 1 special character",
    multiline: true
  }, allow_nil: true
end
