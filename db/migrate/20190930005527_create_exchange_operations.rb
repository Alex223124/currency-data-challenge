class CreateExchangeOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_operations do |t|
      t.string :from_currency
      t.decimal :amount, :precision => 16, :scale => 6
      t.string :to_currency
      t.decimal :result, :precision => 16, :scale => 6

      t.timestamps
    end
  end
end
