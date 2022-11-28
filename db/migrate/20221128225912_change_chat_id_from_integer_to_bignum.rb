class ChangeChatIdFromIntegerToBignum < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :chat_id, :bigint
  end
end
