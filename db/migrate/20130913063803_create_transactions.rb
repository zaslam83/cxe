class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.decimal :amount, :precision => 16, :scale => 4
      t.decimal :comission, :precision => 8, :scale => 4
      t.decimal :comsissionpercent, :precision => 4, :scale => 2
      t.decimal :actualrate, :precision => 8, :scale => 4
      t.decimal :appliedrate, :precision => 8, :scale => 4
      t.decimal :surcharge, :precision => 8, :scale => 4
      t.decimal :totalamt, :precision => 16, :scale => 4
      t.text :description
      t.references :currency
      t.references :branch
      t.references :user

      t.timestamps
    end
    add_index :transactions, :currency_id
    add_index :transactions, :branch_id
    add_index :transactions, :user_id
  end
end
