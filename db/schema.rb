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

ActiveRecord::Schema.define(version: 20131216051459) do

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "questions", force: true do |t|
    t.integer  "quiz_id"
    t.string   "category"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "explanation"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id_and_number"

  create_table "quizzes", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "help_text"
    t.integer  "access_count",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "random",            default: false
    t.boolean  "allow_restart",     default: false
    t.boolean  "allow_delete",      default: false
    t.boolean  "allow_review",      default: true
    t.boolean  "show_answer",       default: true
    t.boolean  "show_explaination", default: true
    t.string   "unique_url"
  end

  add_index "quizzes", ["user_id", "created_at"], name: "index_quizzes_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
