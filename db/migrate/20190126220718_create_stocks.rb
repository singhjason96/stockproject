class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.decimal :tick
      t.decimal :stop

      t.timestamps
    end
  end
end
