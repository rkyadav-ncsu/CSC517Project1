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

ActiveRecord::Schema.define(version: 20150227203431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "createdOn"
    t.boolean  "isActive"
    t.string   "createdBy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "pointValue"
    t.string   "stage"
    t.string   "developer1"
    t.string   "developer2"
    t.integer  "project_id"
    t.string   "createdBy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "developer1_id"
    t.integer  "developer2_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "developer",       default: false
    t.boolean  "admin",           default: false
    t.integer  "project_id"
    t.integer  "story_id"
  end

end
