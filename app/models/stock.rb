class Stock < ActiveRecord::Base
belongs_to :currency
belongs_to :branch
  attr_accessible :branch, :currency, :currentbalance, :openingbalance, :branch_id, :currency_id
  
  validates :branch_id, presence: true
  validates :currency_id, presence: true
  validates :openingbalance, presence: true,
  :numericality => { :greater_than_or_equal_to => 0 }
  
end
