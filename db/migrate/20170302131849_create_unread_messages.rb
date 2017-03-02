class CreateUnreadMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :unread_messages do |t|

      t.references :user, foreign_key: true
      t.references :chat_room, foreign_key: true
      t.integer :read_messages

    end
  end
end
