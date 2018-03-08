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

ActiveRecord::Schema.define(version: 20180307201600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "code_languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "colour_r"
    t.integer "colour_g"
    t.integer "colour_b"
    t.integer "colour_opacity"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.text "company_description"
    t.string "company_url"
    t.string "company_twitter"
    t.string "company_facebook"
    t.string "company_github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "location"
    t.integer "code_languages"
    t.string "logo_url"
    t.string "wallpaper_url"
    t.string "company_strapline"
    t.boolean "featured"
    t.string "company_youtube"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "code_language_id"
    t.bigint "previous_job_id"
    t.index ["code_language_id"], name: "index_experiences_on_code_language_id"
    t.index ["previous_job_id"], name: "index_experiences_on_previous_job_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer "application_id"
    t.string "application_title"
    t.text "application_body"
    t.string "profile_url"
    t.boolean "profile_featured"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "youtube_url"
  end

  create_table "job_languages", force: :cascade do |t|
    t.integer "job_id"
    t.integer "code_language_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "location"
    t.integer "company_id"
    t.integer "user_id"
    t.string "salary"
    t.boolean "featured"
    t.date "posted_date"
    t.integer "code_languages"
    t.integer "aplications"
    t.integer "company"
    t.date "start_date"
    t.text "the_role"
    t.text "applicant_background"
    t.text "skills_essential"
    t.text "skills_ideal"
    t.text "tech_stack"
    t.text "benefits"
  end

  create_table "previous_jobs", force: :cascade do |t|
    t.text "previous_job_description"
    t.string "previous_job_title"
    t.string "previous_company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "profile_bio"
    t.text "profile_objective"
    t.text "profile_additional_notes"
    t.string "profile_url"
    t.string "profile_phone_number"
    t.string "profile_twitter"
    t.string "profile_facebook"
    t.string "profile_github"
    t.string "profile_linkedin"
    t.boolean "profile_featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_youtube"
    t.string "profile_image"
    t.string "profile_wallpaper"
    t.integer "user_id"
  end

  create_table "user_jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_user_jobs_on_job_id"
    t.index ["user_id"], name: "index_user_jobs_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experiences", "code_languages"
  add_foreign_key "experiences", "previous_jobs"
  add_foreign_key "user_jobs", "jobs"
  add_foreign_key "user_jobs", "users"
end
