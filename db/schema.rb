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

ActiveRecord::Schema.define(version: 20141206182607) do

  create_table "badges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "badge_id"
  end

  create_table "houses", force: true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "title"
    t.string   "img"
    t.text     "base_layout_code"
    t.text     "lesson_test_layout_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_answers", force: true do |t|
    t.integer  "item_question_id"
    t.string   "text"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_questions", force: true do |t|
    t.string   "title"
    t.float    "sale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_questions_users", force: true do |t|
    t.integer "user_id"
    t.integer "item_question_id"
  end

  create_table "items", force: true do |t|
    t.integer  "store_id"
    t.string   "title"
    t.float    "price"
    t.float    "health"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_question_answers", force: true do |t|
    t.integer  "quiz_question_id"
    t.text     "text"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_questions", force: true do |t|
    t.integer  "quiz_id"
    t.string   "title"
    t.integer  "points_gained"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.integer  "room_id"
    t.string   "title"
    t.integer  "barier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.integer  "house_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "base_layout_code"
    t.text     "viewer_test_layout_code"
    t.boolean  "video_enabled"
    t.text     "video_url"
    t.text     "quiz_base_layout_code"
    t.float    "quiz_question_code"
    t.boolean  "is_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills_users", force: true do |t|
    t.integer "user_id"
    t.integer "skill_id"
  end

  create_table "stores", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.integer  "points",                 default: 100
    t.float    "health",                 default: 100.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
