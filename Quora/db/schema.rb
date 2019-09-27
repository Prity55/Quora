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

ActiveRecord::Schema.define(version: 2019_09_25_114321) do

  create_table "ans_suggested_edits", force: :cascade do |t|
    t.string "content"
    t.string "status"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_ans_suggested_edits_on_answer_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "upvote_count"
    t.integer "downvote_count"
    t.integer "view"
    t.datetime "last_followed"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data"
    t.string "author"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "answers_users", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answers_users_on_answer_id"
    t.index ["user_id"], name: "index_answers_users_on_user_id"
  end

  create_table "bookmark_answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_bookmark_answers_on_answer_id"
    t.index ["user_id"], name: "index_bookmark_answers_on_user_id"
  end

  create_table "downvotes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_downvotes_on_answer_id"
    t.index ["user_id"], name: "index_downvotes_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "school"
    t.string "concentration"
    t.string "second_concentration"
    t.string "degree"
    t.integer "graduation_year"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "employments", force: :cascade do |t|
    t.string "position"
    t.string "company"
    t.integer "start_year"
    t.integer "end_year"
    t.boolean "current_stage"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "followed_questions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_followed_questions_on_question_id"
    t.index ["user_id"], name: "index_followed_questions_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_follows_on_question_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "author_name"
    t.string "question_link"
    t.integer "follow"
    t.integer "user_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["topic_id"], name: "index_questions_on_topic_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "suggested_edits", force: :cascade do |t|
    t.string "content"
    t.string "status"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_suggested_edits_on_question_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics_users", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topics_users_on_topic_id"
    t.index ["user_id"], name: "index_topics_users_on_user_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.datetime "upvote"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["answer_id"], name: "index_upvotes_on_answer_id"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "user_followers", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_followers_on_user_id"
  end

  create_table "user_followings", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_followings_on_user_id"
  end

  create_table "user_locations", force: :cascade do |t|
    t.string "location"
    t.integer "start_year"
    t.integer "end_year"
    t.boolean "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "profile_credential"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
