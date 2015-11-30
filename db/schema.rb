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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151102024837) do

  
  create_table "contests", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.boolean  "auto_inc_days"
    t.string   "state",            limit: 10
    t.integer  "current_day"
    t.datetime "day_started_at"
    t.date     "currentTradeDate"
    t.date     "startDate"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "credit_rating"
    t.string   "bank"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "exception_logger_logged_exceptions", force: true do |t|
    t.string   "exception_class"
    t.string   "controller_name"
    t.string   "action_name"
    t.text     "message"
    t.text     "backtrace"
    t.text     "environment"
    t.text     "request"
    t.datetime "created_at"
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.float    "quantity"
    t.float    "average_price"
    t.float    "pnl"
    t.float    "eod_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "security_id"
    t.integer  "team_id"
    t.integer  "contest_id"
  end

  create_table "securities", force: true do |t|
    t.string   "name"
    t.string   "ticker"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_class"
    t.string   "sector"
    t.string   "region"
    t.integer  "tick_size"
    t.string   "liquidity",   limit: 10
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contest_id"
    t.boolean  "is_active"
  end

  create_table "trades", force: true do |t|
    t.float    "quantity"
    t.float    "price"
    t.integer  "security_id"
    t.integer  "customer_id"
    t.date     "trade_date"
    t.date     "settlement_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "buy_sell"
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "position_id"
    t.integer  "contest_id"
  end

  add_index "trades", ["customer_id"], name: "index_trades_on_customer_id", using: :btree
  add_index "trades", ["security_id"], name: "index_trades_on_security_id", using: :btree


  create_table "users", force: :cascade do |t|
    t.string   "last_name",              limit: 255
    t.string   "first_name",             limit: 255
    t.string   "email",                  limit: 255
    t.string   "role",                   limit: 255
    t.string   "team",                   limit: 255
    t.integer  "company_id"             
    t.integer  "team_id"
    t.integer  "contest_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "image",                  limit: 255
    t.text     "tokens",                 limit: 65535
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
