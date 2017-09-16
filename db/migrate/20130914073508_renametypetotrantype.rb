class Renametypetotrantype < ActiveRecord::Migration
 rename_column :transactions, :type, :trantype
end
