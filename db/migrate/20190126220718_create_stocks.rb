class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.decimal :stop
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
