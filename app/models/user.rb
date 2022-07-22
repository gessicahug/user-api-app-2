class User < ApplicationRecord
  has_secure_password
  has_secure_token

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, :name presence: true
end
