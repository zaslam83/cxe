class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :currencyname
      t.string :currencycode
      t.decimal :buyrate, :precision => 8, :scale => 4
      t.decimal :sellrate, :precision => 8, :scale => 4 

      t.timestamps
    end
  end
end
