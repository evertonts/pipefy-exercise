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

ActiveRecord::Schema.define(version: 20180112205204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "phase_id", null: false
    t.jsonb "fields", default: {}, null: false
    t.date "due_date"
    t.serial "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_cards_on_external_id", unique: true
    t.index ["phase_id"], name: "index_cards_on_phase_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.serial "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_organizations_on_external_id", unique: true
  end

  create_table "phases", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "pipe_id", null: false
    t.jsonb "fields", default: {}, null: false
    t.serial "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_phases_on_external_id", unique: true
    t.index ["pipe_id"], name: "index_phases_on_pipe_id"
  end

  create_table "pipes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "organization_id", null: false
    t.jsonb "start_form_fields", default: {}, null: false
    t.serial "external_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_pipes_on_external_id", unique: true
    t.index ["organization_id"], name: "index_pipes_on_organization_id"
  end

  add_foreign_key "cards", "phases"
  add_foreign_key "phases", "pipes"
  add_foreign_key "pipes", "organizations"
end
