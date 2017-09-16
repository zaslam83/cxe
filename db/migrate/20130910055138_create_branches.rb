class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
