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

ActiveRecord::Schema.define(version: 20161017151209) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "logo"
    t.string   "name"
    t.string   "code"
    t.date     "validity"
    t.integer  "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.integer  "points"
    t.decimal  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "avatar"
    t.string   "sex"
    t.date     "birth_date"
    t.string   "street"
    t.string   "complement"
    t.string   "neighborhood"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "zip_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "image"
    t.index ["city_id"], name: "index_profiles_on_city_id"
    t.index ["country_id"], name: "index_profiles_on_country_id"
    t.index ["state_id"], name: "index_profiles_on_state_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "raffles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "points"
    t.integer  "amount"
    t.string   "image"
    t.string   "string"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "winner_ticket_id"
    t.index ["winner_ticket_id"], name: "index_raffles_on_winner_ticket_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "uf"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "ticket_transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "raffle_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "owner_id"
    t.integer  "purchase_status"
    t.integer  "ticket_transaction_id"
    t.index ["owner_id"], name: "index_tickets_on_owner_id"
    t.index ["raffle_id"], name: "index_tickets_on_raffle_id"
    t.index ["ticket_transaction_id"], name: "index_tickets_on_ticket_transaction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.integer  "group"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
