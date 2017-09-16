class AddBranchReferenceToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :branch_id, :integer
    add_index :currencies, :branch_id
  end
end
