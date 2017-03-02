class CreteUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :messages_count
      t.timestamps
    end
  end
end
