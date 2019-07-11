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

ActiveRecord::Schema.define(version: 2019_07_11_173009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.text "answer_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "team_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_participations_on_team_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "type"
    t.text "question_content"
    t.integer "answer_id"
    t.bigint "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_questions_on_host_id"
  end

  create_table "quiz_nights", force: :cascade do |t|
    t.bigint "quiz_id"
    t.date "date"
    t.string "location"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_nights_on_quiz_id"
  end

  create_table "quiz_rounds", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_rounds_on_quiz_id"
    t.index ["round_id"], name: "index_quiz_rounds_on_round_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "host_id"
    t.string "nickname"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_quizzes_on_host_id"
  end

  create_table "round_questions", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_round_questions_on_question_id"
    t.index ["round_id"], name: "index_round_questions_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "host_id"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_rounds_on_host_id"
  end

  create_table "team_answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "quiz_night_id"
    t.bigint "participation_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_team_answers_on_answer_id"
    t.index ["participation_id"], name: "index_team_answers_on_participation_id"
    t.index ["question_id"], name: "index_team_answers_on_question_id"
    t.index ["quiz_night_id"], name: "index_team_answers_on_quiz_night_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "participations", "teams"
  add_foreign_key "questions", "hosts"
  add_foreign_key "quiz_nights", "quizzes"
  add_foreign_key "quiz_rounds", "quizzes"
  add_foreign_key "quiz_rounds", "rounds"
  add_foreign_key "quizzes", "hosts"
  add_foreign_key "round_questions", "questions"
  add_foreign_key "round_questions", "rounds"
  add_foreign_key "rounds", "hosts"
  add_foreign_key "team_answers", "answers"
  add_foreign_key "team_answers", "participations"
  add_foreign_key "team_answers", "questions"
  add_foreign_key "team_answers", "quiz_nights"
end
