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

ActiveRecord::Schema.define(version: 20161030233048) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
    t.string   "password_digest"
  end

  create_table "appointments", force: :cascade do |t|
    t.text     "reason"
    t.date     "apt_date"
    t.string   "apt_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "doctor_id"
    t.integer  "user_id"
    t.string   "appointment_token"
    t.string   "appt_time"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "mobile"
    t.text     "message"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "message_title"
    t.boolean  "read_message",  default: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "doctors_name"
    t.string   "speciality"
    t.text     "professional_details"
    t.string   "work_experience"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "department_id"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "working_hours"
    t.string   "working_days"
    t.string   "current_hospital"
    t.boolean  "status",                     default: true
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "gender"
    t.integer  "city_id"
    t.integer  "gender_id"
    t.index ["city_id"], name: "index_doctors_on_city_id"
    t.index ["department_id"], name: "index_doctors_on_department_id"
    t.index ["gender_id"], name: "index_doctors_on_gender_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_phone",               limit: 50
    t.date     "dob"
    t.integer  "gender_id"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.integer  "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
  end

end
