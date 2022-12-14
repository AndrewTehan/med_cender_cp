# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_14_070433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "full_name", limit: 255, null: false
    t.string "phone_number", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "description", limit: 255, null: false
    t.bigint "medical_center_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medical_center_id"], name: "index_departments_on_medical_center_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "full_name", limit: 255, null: false
    t.string "phone_number", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["department_id"], name: "index_doctors_on_department_id"
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "inspection_reports", force: :cascade do |t|
    t.string "medical_report"
    t.string "medical_appointment"
    t.bigint "visit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["visit_id"], name: "index_inspection_reports_on_visit_id"
  end

  create_table "medical_centers", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "address", limit: 255, null: false
    t.string "schedule", null: false
    t.string "legal_entity", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name", limit: 255, null: false
    t.string "phone_number", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "passport_number", limit: 255, null: false
    t.bigint "medical_center_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medical_center_id"], name: "index_patients_on_medical_center_id"
  end

  create_table "visits", force: :cascade do |t|
    t.string "datetime"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_visits_on_doctor_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
  end

  add_foreign_key "departments", "medical_centers"
  add_foreign_key "doctors", "departments"
  add_foreign_key "inspection_reports", "visits"
  add_foreign_key "patients", "medical_centers"
  add_foreign_key "visits", "doctors"
  add_foreign_key "visits", "patients"
end
