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

ActiveRecord::Schema.define(version: 20161223165339) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "father_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
    t.index ["father_id"], name: "index_categories_on_father_id", using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.date     "validity"
    t.integer  "discount"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "newsletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "package_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tid"
    t.string   "card_number"
    t.integer  "coupon_id"
    t.string   "aasm_state"
    t.index ["coupon_id"], name: "index_package_transactions_on_coupon_id", using: :btree
    t.index ["package_id"], name: "index_package_transactions_on_package_id", using: :btree
    t.index ["user_id"], name: "index_package_transactions_on_user_id", using: :btree
  end

  create_table "packages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "points"
    t.decimal  "value",               precision: 10
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "active",                             default: 1
  end

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_partners_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "last_name"
    t.index ["city_id"], name: "index_profiles_on_city_id", using: :btree
    t.index ["country_id"], name: "index_profiles_on_country_id", using: :btree
    t.index ["state_id"], name: "index_profiles_on_state_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "raffles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "points"
    t.integer  "amount"
    t.string   "string"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "winner_ticket_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "deadline"
    t.integer  "category_id"
    t.integer  "active",              default: 1
    t.index ["category_id"], name: "index_raffles_on_category_id", using: :btree
    t.index ["winner_ticket_id"], name: "index_raffles_on_winner_ticket_id", using: :btree
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "uf"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "ticket_transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amount"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ticket_transactions_on_user_id", using: :btree
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "raffle_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "owner_id"
    t.integer  "ticket_transaction_id"
    t.integer  "active",                limit: 1, default: 1
    t.index ["owner_id"], name: "index_tickets_on_owner_id", using: :btree
    t.index ["raffle_id"], name: "index_tickets_on_raffle_id", using: :btree
    t.index ["ticket_transaction_id"], name: "index_tickets_on_ticket_transaction_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.integer  "group",                                            comment: "For now, 0 - admin, 1 - common user"
    t.string   "cpf"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "package_transactions", "coupons"
  add_foreign_key "package_transactions", "packages"
  add_foreign_key "package_transactions", "users"
  add_foreign_key "partners", "users"
  add_foreign_key "profiles", "cities"
  add_foreign_key "profiles", "countries"
  add_foreign_key "profiles", "states"
  add_foreign_key "profiles", "users"
  add_foreign_key "raffles", "categories"
  add_foreign_key "raffles", "tickets", column: "winner_ticket_id"
  add_foreign_key "states", "countries"
  add_foreign_key "ticket_transactions", "users"
  add_foreign_key "tickets", "raffles"
  add_foreign_key "tickets", "ticket_transactions"
  add_foreign_key "tickets", "users", column: "owner_id"
end
