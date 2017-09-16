class User < ActiveRecord::Base
belongs_to :branch
  attr_accessible :email, :name, :password , :username, :userrole, :isactive, :branch_id 
  has_secure_password
  validates :password, length: { minimum: 3 }
end
