class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userrole, :string
    add_column :users, :isactive, :boolean
  end
end
