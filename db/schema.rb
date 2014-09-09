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

ActiveRecord::Schema.define(version: 20140909012503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",                         null: false
    t.string   "category_type",                null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "available",     default: true, null: false
  end

  add_index "categories", ["name", "category_type"], name: "index_categories_on_name_and_category_type", unique: true, using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "donations", force: true do |t|
    t.integer  "amount",     null: false
    t.integer  "user_id",    null: false
    t.integer  "level_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id", null: false
  end

  add_index "donations", ["level_id"], name: "index_donations_on_level_id", using: :btree
  add_index "donations", ["project_id"], name: "index_donations_on_project_id", using: :btree
  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "levels", force: true do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "amount",      null: false
    t.integer  "user_id",     null: false
    t.integer  "project_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "levels", ["project_id"], name: "index_levels_on_project_id", using: :btree
  add_index "levels", ["title", "project_id"], name: "index_levels_on_title_and_project_id", unique: true, using: :btree
  add_index "levels", ["user_id"], name: "index_levels_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title",                                   null: false
    t.text     "blurb",                                   null: false
    t.text     "description",                             null: false
    t.integer  "user_id",                                 null: false
    t.integer  "category_id",                             null: false
    t.integer  "cost",        default: 0,                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image",       default: "project/image/1", null: false
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["title", "user_id"], name: "index_projects_on_title_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                            null: false
    t.string   "name",                                             null: false
    t.string   "password_digest",                                  null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "account_enabled", default: true,                   null: false
    t.boolean  "site_admin",      default: false,                  null: false
    t.string   "image",           default: "uploads/User/image/1"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
