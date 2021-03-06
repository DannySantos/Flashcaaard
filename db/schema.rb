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

ActiveRecord::Schema.define(version: 20161110211805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_set_flashcards", force: :cascade do |t|
    t.integer  "flashcard_id"
    t.integer  "card_set_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["card_set_id"], name: "index_card_set_flashcards_on_card_set_id", using: :btree
    t.index ["flashcard_id"], name: "index_card_set_flashcards_on_flashcard_id", using: :btree
  end

  create_table "card_sets", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_card_sets_on_user_id", using: :btree
  end

  create_table "flashcard_tags", force: :cascade do |t|
    t.integer  "flashcard_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["flashcard_id"], name: "index_flashcard_tags_on_flashcard_id", using: :btree
    t.index ["tag_id"], name: "index_flashcard_tags_on_tag_id", using: :btree
  end

  create_table "flashcards", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_flashcards_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "card_set_flashcards", "card_sets"
  add_foreign_key "card_set_flashcards", "flashcards"
  add_foreign_key "card_sets", "users"
  add_foreign_key "flashcard_tags", "flashcards"
  add_foreign_key "flashcard_tags", "tags"
  add_foreign_key "flashcards", "users"
end
