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

ActiveRecord::Schema.define(version: 2019_12_14_155907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.integer "power"
    t.integer "precision"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "power_point"
    t.index ["type_id"], name: "index_attacks_on_type_id"
  end

  create_table "pokedexes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_pokedexes_on_user_id"
  end

  create_table "pokedexes_pokemons", force: :cascade do |t|
    t.integer "pokedex_id"
    t.integer "pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.float "height"
    t.integer "weight"
    t.string "picture"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.integer "number"
    t.boolean "caught", default: false
    t.index ["type_id"], name: "index_pokemons_on_type_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "teams_pokemons", force: :cascade do |t|
    t.integer "team_id"
    t.integer "pokemon_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "user"
    t.string "username"
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attacks", "types"
  add_foreign_key "pokedexes", "users"
  add_foreign_key "pokemons", "types"
  add_foreign_key "teams", "users"
end
