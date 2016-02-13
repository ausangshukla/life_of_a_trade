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

ActiveRecord::Schema.define(version: 20160131040117) do

  create_table "block_amounts", force: :cascade do |t|
    t.integer  "user_id",               limit: 8
    t.integer  "order_id",              limit: 8
    t.float    "blocked_amount",        limit: 53
    t.float    "actual_amount_charged", limit: 53
    t.text     "status",                limit: 65535
    t.datetime "created_at",                          precision: 3
    t.datetime "updated_at",                          precision: 3
  end

  create_table "contests", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active"
    t.boolean  "auto_inc_days"
    t.string   "state",            limit: 10
    t.integer  "current_day",      limit: 4
    t.datetime "day_started_at"
    t.date     "currentTradeDate"
    t.date     "startDate"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "credit_rating",  limit: 255
    t.string   "bank",           limit: 255
    t.string   "account_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "exception_logger_logged_exceptions", force: :cascade do |t|
    t.string   "exception_class", limit: 255
    t.string   "controller_name", limit: 255
    t.string   "action_name",     limit: 255
    t.text     "message",         limit: 65535
    t.text     "backtrace",       limit: 65535
    t.text     "environment",     limit: 65535
    t.text     "request",         limit: 65535
    t.datetime "created_at"
  end

  create_table "market_events", force: :cascade do |t|
    t.text     "name",         limit: 65535,               null: false
    t.string   "event_type",   limit: 10,                  null: false
    t.string   "summary",      limit: 255,                 null: false
    t.text     "description",  limit: 65535
    t.string   "direction",    limit: 5,                   null: false
    t.string   "intensity",    limit: 10,                  null: false
    t.string   "asset_class",  limit: 10
    t.string   "region",       limit: 10
    t.string   "sector",       limit: 20
    t.string   "ticker",       limit: 5
    t.text     "external_url", limit: 65535
    t.datetime "created_at",                 precision: 3
    t.datetime "updated_at",                 precision: 3
  end

  create_table "orders", force: :cascade do |t|
    t.string   "exchange",               limit: 10,               null: false
    t.string   "buy_sell",               limit: 5,                null: false
    t.string   "order_type",             limit: 10,               null: false
    t.integer  "user_id",                limit: 8,                null: false
    t.integer  "security_id",            limit: 8,                null: false
    t.float    "quantity",               limit: 53,               null: false
    t.float    "unfilled_qty",           limit: 53,               null: false
    t.float    "price",                  limit: 53,               null: false
    t.string   "pre_trade_check_status", limit: 20,               null: false
    t.string   "trade_status",           limit: 20,               null: false
    t.string   "status",                 limit: 20,               null: false
    t.datetime "created_at",                        precision: 3
    t.datetime "updated_at",                        precision: 3
  end

  create_table "positions", force: :cascade do |t|
    t.text     "ticker",        limit: 65535, null: false
    t.integer  "security_id",   limit: 8,     null: false
    t.integer  "user_id",       limit: 8,     null: false
    t.float    "quantity",      limit: 53,    null: false
    t.float    "average_price", limit: 53,    null: false
    t.float    "pnl",           limit: 53,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["security_id", "user_id"], name: "POS_IDX", unique: true, using: :btree

  create_table "securities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "ticker",      limit: 255
    t.string   "description", limit: 255
    t.float    "price",       limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_class", limit: 255
    t.string   "sector",      limit: 255
    t.string   "region",      limit: 255
    t.integer  "tick_size",   limit: 4
    t.string   "liquidity",   limit: 10
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contest_id",  limit: 4
    t.boolean  "is_active"
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "trade_date",                     null: false
    t.datetime "settlement_date",                null: false
    t.integer  "security_id",      limit: 8,     null: false
    t.float    "quantity",         limit: 53,    null: false
    t.float    "price",            limit: 53,    null: false
    t.text     "buy_sell",         limit: 65535, null: false
    t.integer  "user_id",          limit: 8,     null: false
    t.integer  "order_id",         limit: 8,     null: false
    t.integer  "matched_order_id", limit: 8,     null: false
    t.text     "state",            limit: 65535, null: false
    t.text     "exchange",         limit: 65535, null: false
    t.float    "commissions",      limit: 53,    null: false
    t.float    "taxes",            limit: 53,    null: false
    t.float    "total_amount",     limit: 53,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "triggered_events", force: :cascade do |t|
    t.integer  "market_event_id", limit: 8, null: false
    t.boolean  "sent_to_sim",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name",              limit: 255
    t.string   "first_name",             limit: 255
    t.string   "email",                  limit: 255
    t.string   "role",                   limit: 255
    t.string   "team",                   limit: 255
    t.integer  "company_id",             limit: 4
    t.integer  "team_id",                limit: 4
    t.integer  "contest_id",             limit: 4
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
    t.float    "account_balance",        limit: 53,    default: 0.0
    t.float    "blocked_amount",         limit: 53,    default: 0.0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
