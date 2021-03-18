class Message < ApplicationRecord
  belongs_to :speaker, class_name: 'User', foreign_key: 'speaker_id', optional: true
end
