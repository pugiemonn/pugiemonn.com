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

ActiveRecord::Schema.define(version: 20150228111130) do

  create_table "events", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "service",    limit: 255
    t.string   "address",    limit: 255
    t.string   "event_url",  limit: 255
    t.text     "catch",      limit: 65535
    t.decimal  "lon",                      precision: 10
    t.decimal  "lat",                      precision: 10
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "place",      limit: 255
    t.integer  "limit",      limit: 4
    t.integer  "accepted",   limit: 4
    t.integer  "waiting",    limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
