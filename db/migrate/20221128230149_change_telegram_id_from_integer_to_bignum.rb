class ChangeTelegramIdFromIntegerToBignum < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :telegram_id, :bigint
  end
end
