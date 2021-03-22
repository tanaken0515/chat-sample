class Message < ApplicationRecord
  belongs_to :speaker, class_name: 'User', foreign_key: 'speaker_id', optional: true

  def owned_by?(user)
    speaker.present? && speaker == user
  end
end
