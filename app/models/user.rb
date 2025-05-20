class User < ApplicationRecord
  has_secure_password

  VALID_PASSWORD_REGEX = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[[:^alnum:]])[\w[:^alnum:]]{8,}$/

  validates :email, presence: true

  validates :password, format: {
    with: VALID_PASSWORD_REGEX,
    message: 'must include: 1 uppercase, 1 lowercase, 1 digit and 1 special character',
    multiline: true
  }
end