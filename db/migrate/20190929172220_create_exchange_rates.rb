class CreateExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.string :source_currency
      t.string :target_currency
      t.decimal :rate, :precision => 16, :scale => 6
      t.timestamps
    end
  end
end