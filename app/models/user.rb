class User < ApplicationRecord
  has_many :messages, class_name: 'Message', foreign_key: 'speaker_id'
  has_secure_password

  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }
end
