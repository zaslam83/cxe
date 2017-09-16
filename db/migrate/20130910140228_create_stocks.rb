class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.decimal :openingbalance, :precision => 16, :scale => 4
      t.decimal :currentbalance, :precision => 16, :scale => 4
      t.references :currency
      t.references :branch

      t.timestamps
    end
  end
end
