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

ActiveRecord::Schema.define(version: 20200518221814) do

  create_table "bible_reference_desires", force: :cascade do |t|
    t.integer  "bible_reference_id"
    t.integer  "desire_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "bible_reference_harvests", force: :cascade do |t|
    t.integer  "bible_reference_id"
    t.integer  "harvest_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "bible_reference_seeds", force: :cascade do |t|
    t.integer  "bible_reference_id"
    t.integer  "seed_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "bible_references", force: :cascade do |t|
    t.string   "reference",  null: false
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desires", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "harvest_sources", force: :cascade do |t|
    t.integer  "harvest_id"
    t.integer  "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "harvests", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "completed",             default: false
    t.integer  "months_to_completion"
    t.integer  "weeks_to_completion"
    t.integer  "days_to_completion"
    t.integer  "hours_to_completion"
    t.integer  "minutes_to_completion"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "target_id"
    t.string   "name",                       null: false
    t.boolean  "sown",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "received_items", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seed_targets", force: :cascade do |t|
    t.integer  "seed_id"
    t.integer  "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.decimal  "money_received",   default: 0.0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "months_received"
    t.integer  "weeks_received"
    t.integer  "days_received"
    t.integer  "hours_received"
    t.integer  "minutes_received"
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.decimal  "money_sown",     default: 0.0
    t.decimal  "money_to_sow",   default: 0.0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "months_sown"
    t.integer  "weeks_sown"
    t.integer  "days_sown"
    t.integer  "hours_sown"
    t.integer  "minutes_sown"
    t.integer  "months_to_sow"
    t.integer  "weeks_to_sow"
    t.integer  "days_to_sow"
    t.integer  "hours_to_sow"
    t.integer  "minutes_to_sow"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
