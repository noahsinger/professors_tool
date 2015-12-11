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

ActiveRecord::Schema.define(:version => 20151211183808) do

  create_table "assignments", :force => true do |t|
    t.string   "title"
    t.datetime "duedate"
    t.integer  "section_id"
    t.integer  "lab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_url"
  end

  create_table "awarded_points", :force => true do |t|
    t.integer  "work_id"
    t.integer  "requirement_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "isbn"
    t.integer  "course_id"
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "discipline"
    t.string   "number"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prerequisite"
    t.string   "next_course"
    t.text     "required_materials"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "queue"
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.string   "office_number"
    t.string   "phone_number"
    t.string   "associate_dean"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollment_snapshots", :force => true do |t|
    t.integer  "section_id"
    t.integer  "enrollment_count"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "enrollment_snapshots", ["section_id"], :name => "index_enrollment_snapshots_on_section_id"

  create_table "enrollment_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "enrollment_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "examples", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "file"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "extras", :force => true do |t|
    t.integer  "lab_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "general_contacts", :force => true do |t|
    t.string   "return_email"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "grade_requests", :force => true do |t|
    t.integer  "section_id"
    t.integer  "enrollment_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "homework_return_requests", :force => true do |t|
    t.string   "email"
    t.integer  "assignment_id"
    t.integer  "enrollment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "how_tos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "phone_number"
    t.string   "office_number"
    t.string   "email"
    t.string   "website"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "office_hours_file_name"
    t.string   "office_hours_content_type"
    t.integer  "office_hours_file_size"
    t.datetime "office_hours_updated_at"
    t.string   "twitter_handle"
  end

  create_table "labs", :force => true do |t|
    t.integer  "course_id"
    t.string   "title"
    t.string   "objective"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
    t.boolean  "allow_uploads"
  end

  create_table "materials", :force => true do |t|
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.datetime "when"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "objectives", :force => true do |t|
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "policies", :force => true do |t|
    t.integer  "syllabus_part_id"
    t.integer  "course_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requirements", :force => true do |t|
    t.integer  "lab_id"
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "semester_id"
    t.integer  "course_id"
    t.string   "call_number"
    t.string   "section_number"
    t.string   "meeting_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "instructor_id"
    t.string   "room_number"
  end

  create_table "semesters", :force => true do |t|
    t.integer  "year"
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "steps", :force => true do |t|
    t.string   "title"
    t.text     "instructions"
    t.integer  "position"
    t.integer  "how_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "goes_by"
  end

  create_table "syllabus_parts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorials", :force => true do |t|
    t.integer  "position"
    t.integer  "course_id"
    t.integer  "how_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "waiters", :force => true do |t|
    t.string   "email"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "waiters", ["course_id"], :name => "index_waiters_on_course_id"

  create_table "works", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "enrollment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.text     "instructors_comments"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.string   "withdrawal_code"
  end

end
