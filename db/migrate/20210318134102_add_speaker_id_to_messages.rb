class AddSpeakerIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :speaker_id, :integer
    add_index :messages, :speaker_id
  end
end
