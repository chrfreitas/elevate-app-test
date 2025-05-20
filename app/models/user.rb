class User < ApplicationRecord
  has_secure_password

  validates :password, format: {
    with: /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[[:^alnum:]])[\w[:^alnum:]]{8,}$/,
    message: 'must include: 1 uppercase, 1 lowercase, 1 digit and 1 special character',
    multiline: true
  }
end