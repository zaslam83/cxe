class Transaction < ActiveRecord::Base
  belongs_to :currency
  belongs_to :branch
  belongs_to :user
  attr_accessible :actualrate, :amount, :appliedrate, :comission, :comsissionpercent, :description, :surcharge, :totalamt, :type, :currency_id
end
