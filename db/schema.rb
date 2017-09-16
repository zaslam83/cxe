# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130914132026) do

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "currencies", :force => true do |t|
    t.string   "currencyname"
    t.string   "currencycode"
    t.decimal  "buyrate",      :precision => 8, :scale => 4
    t.decimal  "sellrate",     :precision => 8, :scale => 4
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "stocks", :force => true do |t|
    t.decimal  "openingbalance", :precision => 16, :scale => 4
    t.decimal  "currentbalance", :precision => 16, :scale => 4
    t.integer  "currency_id"
    t.integer  "branch_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "trantype"
    t.decimal  "amount",            :precision => 16, :scale => 4
    t.decimal  "comission",         :precision => 8,  :scale => 4
    t.decimal  "comsissionpercent", :precision => 4,  :scale => 2
    t.decimal  "actualrate",        :precision => 8,  :scale => 4
    t.decimal  "appliedrate",       :precision => 8,  :scale => 4
    t.decimal  "surcharge",         :precision => 8,  :scale => 4
    t.decimal  "totalamt",          :precision => 16, :scale => 4
    t.text     "description"
    t.integer  "currency_id"
    t.integer  "branch_id"
    t.integer  "user_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "transactions", ["branch_id"], :name => "index_transactions_on_branch_id"
  add_index "transactions", ["currency_id"], :name => "index_transactions_on_currency_id"
  add_index "transactions", ["user_id"], :name => "index_transactions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "username"
    t.integer  "branch_id"
    t.string   "userrole"
    t.boolean  "isactive"
  end

  add_index "users", ["branch_id"], :name => "index_users_on_branch_id"

end
