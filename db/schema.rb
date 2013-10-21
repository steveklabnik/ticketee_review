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

ActiveRecord::Schema.define(version: 20131021155037) do

  create_table "assets", force: true do |t|
    t.string   "asset"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  add_index "comments", ["ticket_id"], name: "index_comments_on_ticket_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "permissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.string   "background"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",    default: false
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "tags_tickets", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  create_table "ticket_watchers", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "ticket_id"
  end

  create_table "tickets", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "asset"
    t.integer  "state_id"
  end

  add_index "tickets", ["project_id"], name: "index_tickets_on_project_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

end
