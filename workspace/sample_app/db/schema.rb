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

ActiveRecord::Schema.define(version: 20150410001639) do

  create_table "courses", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "university_id"
    t.string   "course_name"
    t.string   "course_number"
    t.string   "section_number"
    t.string   "enrollment_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multiple_choice_options", force: true do |t|
    t.integer  "question_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "quiz_id"
    t.text     "question_text"
    t.string   "type"
    t.binary   "picture",                limit: 10485760
    t.integer  "multiple_choice_answer"
    t.text     "input_text_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.string   "title"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "question_id"
    t.integer  "student_id"
    t.integer  "multiple_choice_answer"
    t.text     "text_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_course_pairings", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.boolean  "validated",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "sub",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
