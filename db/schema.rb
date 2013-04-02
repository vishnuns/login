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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130402035244) do

  create_table "attendance_remarks", :force => true do |t|
    t.integer  "attendance_id"
    t.string   "remarks"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "attendance_remarks", ["attendance_id"], :name => "index_attendance_remarks_on_attendance_id"

  create_table "attendance_reports", :force => true do |t|
    t.integer  "student_id"
    t.integer  "term_id"
    t.integer  "no_absent_days"
    t.integer  "total_working_days"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "attendances", :force => true do |t|
    t.integer  "student_id"
    t.datetime "date"
    t.string   "present"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "term_id"
  end

  add_index "attendances", ["date"], :name => "index_attendances_on_date"
  add_index "attendances", ["student_id"], :name => "index_attendances_on_student_id"

  create_table "backlogs", :force => true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "cleared"
    t.integer  "cleared_sem"
    t.integer  "grade_points"
  end

  create_table "departments", :force => true do |t|
    t.integer "dept_code", :null => false
    t.string  "name",      :null => false
  end

  create_table "exams", :force => true do |t|
    t.string   "name",          :null => false
    t.integer  "department_id"
    t.integer  "semester"
    t.datetime "date"
  end

  create_table "marks", :force => true do |t|
    t.integer "student_id"
    t.integer "exam_id"
    t.integer "subject_id"
    t.integer "marks"
    t.string  "result"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "registrations", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "results", :force => true do |t|
    t.integer "student_id"
    t.integer "exam_id"
    t.integer "total"
    t.float   "percentage"
    t.integer "rank"
    t.string  "result"
    t.string  "section"
    t.integer "no_failed"
  end

  create_table "students", :force => true do |t|
    t.string  "roll_no",             :null => false
    t.string  "name",                :null => false
    t.integer "department_id"
    t.integer "semester"
    t.string  "section"
    t.string  "reg_no"
    t.integer "credits_earned"
    t.integer "grade_points_earned"
    t.float   "CGPA"
  end

  add_index "students", ["roll_no"], :name => "index_students_on_roll_no"

  create_table "subjects", :force => true do |t|
    t.string  "subject_code",  :null => false
    t.string  "name",          :null => false
    t.integer "semester",      :null => false
    t.integer "credits",       :null => false
    t.integer "department_id"
    t.string  "abbreviation",  :null => false
    t.string  "subject_type"
  end

  add_index "subjects", ["subject_code"], :name => "index_subjects_on_subject_code"

  create_table "terms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uni_exam_performances", :force => true do |t|
    t.integer  "semester"
    t.integer  "student_id"
    t.float    "GPA"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uni_exams", :force => true do |t|
    t.integer  "semester"
    t.integer  "department_id"
    t.integer  "exam_year"
    t.string   "month"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "students_sem"
    t.integer  "total_credits"
    t.integer  "batch"
  end

  add_index "uni_exams", ["batch"], :name => "index_uni_exams_on_batch"

  create_table "uni_marks", :force => true do |t|
    t.integer "student_id"
    t.integer "uni_exam_id"
    t.integer "subject_id"
    t.string  "grade"
    t.integer "grade_points"
    t.string  "result"
    t.boolean "current"
  end

  create_table "uni_results", :force => true do |t|
    t.integer  "student_id"
    t.integer  "uni_exam_id"
    t.float    "GPA"
    t.integer  "dept_rank"
    t.integer  "section_rank"
    t.string   "result"
    t.string   "section"
    t.integer  "no_failed"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "grade_points_earned"
    t.integer  "credits_earned"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "user_type"
    t.integer  "semester"
    t.integer  "department_id"
    t.string   "section"
  end

end
