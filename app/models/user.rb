class User < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }
end
