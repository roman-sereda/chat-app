class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.integer :messages_count, default: 0
      t.timestamps
    end
  end
end
