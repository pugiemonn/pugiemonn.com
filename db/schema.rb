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

ActiveRecord::Schema.define(version: 20160221025548) do

  create_table "comments", force: :cascade do |t|
    t.integer  "integer",    limit: 4,     null: false
    t.text     "comment",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "service",       limit: 255
    t.string   "address",       limit: 255
    t.string   "event_url",     limit: 255
    t.text     "catch",         limit: 65535
    t.decimal  "lon",                         precision: 10
    t.decimal  "lat",                         precision: 10
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "place",         limit: 255
    t.integer  "tickets_limit", limit: 4
    t.integer  "accepted",      limit: 4
    t.integer  "waiting",       limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "owner_id",      limit: 4
  end

  add_index "events", ["owner_id"], name: "index_events_on_owner_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "taggings", ["event_id"], name: "index_taggings_on_event_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tickets", ["event_id", "user_id"], name: "index_tickets_on_event_id_and_user_id", unique: true, using: :btree
  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["user_id", "event_id"], name: "index_tickets_on_user_id_and_event_id", unique: true, using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.string   "nickname",   limit: 255, null: false
    t.string   "image_url",  limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  add_foreign_key "taggings", "events"
  add_foreign_key "taggings", "tags"
end
