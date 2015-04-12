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

ActiveRecord::Schema.define(version: 20150412210345) do

  create_table "activites", force: true do |t|
    t.string   "title"
    t.string   "desc"
    t.string   "chapitre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activites_users", id: false, force: true do |t|
    t.integer "user_id",     null: false
    t.integer "activite_id", null: false
  end

  add_index "activites_users", ["activite_id", "user_id"], name: "index_activites_users_on_activite_id_and_user_id"
  add_index "activites_users", ["user_id", "activite_id"], name: "index_activites_users_on_user_id_and_activite_id"

  create_table "ahoy_events", id: false, force: true do |t|
    t.binary   "id"
    t.binary   "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time"
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id"
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id"

  create_table "chapitres", force: true do |t|
    t.string   "title"
    t.string   "intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "desc"
  end

  create_table "questions", force: true do |t|
    t.string  "desc"
    t.integer "activite_id"
  end

  add_index "questions", ["activite_id"], name: "index_questions_on_activite_id"

  create_table "ressources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "lang"
    t.string   "level"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapitre_id"
    t.text     "desc"
    t.string   "tags"
    t.string   "categorie"
    t.string   "media"
    t.boolean  "feedback"
    t.string   "user_id"
    t.boolean  "important"
  end

  add_index "ressources", ["chapitre_id"], name: "index_ressources_on_chapitre_id"
  add_index "ressources", ["user_id"], name: "index_ressources_on_user_id"

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "reset_password_key"
    t.boolean "admin"
  end

  create_table "visits", id: false, force: true do |t|
    t.binary   "id"
    t.binary   "visitor_id"
    t.integer  "user_id"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

end
