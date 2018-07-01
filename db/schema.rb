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

ActiveRecord::Schema.define(version: 2018_07_01_171240) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.text "description"
    t.integer "parent_id"
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_courses_on_parent_id"
  end

  create_table "courses_teachers", id: false, force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "course_id", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "teacher_id"
    t.string "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_ratings_on_teacher_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "title"
    t.string "firstname"
    t.string "lastname"
    t.integer "gender"
    t.string "degree"
    t.date "start_date"
    t.string "school_graduated"
    t.text "major_accomplishments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
