class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :chat_id, unique: true
      t.integer :telegram_id, unique: true
      t.string :chat_name
      t.string :username
      t.string :first_name
      t.integer :numbers_wins
      t.integer :trivia_wins
      t.integer :hangman_wins

      t.timestamps
    end
  end
end
