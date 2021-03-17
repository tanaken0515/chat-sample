class User < ApplicationRecord
  has_secure_password

  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }
end
