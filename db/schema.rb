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

ActiveRecord::Schema.define(version: 20160609192643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cit_publications", force: :cascade do |t|
    t.string   "elib_id"
    t.string   "name"
    t.string   "source_id"
    t.string   "main_author"
    t.string   "all_author"
    t.string   "periodical_name"
    t.string   "periodical_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "publication_id"
  end

  add_index "cit_publications", ["publication_id"], name: "index_cit_publications_on_publication_id", using: :btree

  create_table "main_publications", force: :cascade do |t|
    t.string   "elib_id"
    t.string   "name"
    t.string   "main_author"
    t.string   "author_elib_id"
    t.string   "edu_org"
    t.string   "period"
    t.string   "year"
    t.string   "rinz_cited"
    t.string   "nuc_rinz_cited"
    t.string   "scopus_cited"
    t.string   "wos_cited"
    t.string   "imp_f"
    t.string   "norm_cit"
    t.string   "norm_cit_dir"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "publication_id"
    t.string   "mephi_index"
  end

  add_index "main_publications", ["publication_id"], name: "index_main_publications_on_publication_id", using: :btree

  create_table "publications", force: :cascade do |t|
    t.integer  "elib_id"
    t.string   "name"
    t.string   "main_author"
    t.string   "all_author"
    t.string   "periodical_name"
    t.integer  "number",            default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "periodical_number"
    t.integer  "source_person_id"
    t.string   "periodical_id"
    t.string   "index"
  end

  add_index "publications", ["source_person_id"], name: "index_publications_on_source_person_id", using: :btree

  create_table "source_people", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "second_name"
    t.integer  "mephi_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "count",        default: 0
    t.integer  "global_count", default: 0
    t.string   "elib_id"
  end

  create_table "sub_publications", force: :cascade do |t|
    t.string   "period_name"
    t.string   "edu_org"
    t.string   "number"
    t.string   "year"
    t.string   "pub_id"
    t.string   "pub_name"
    t.string   "pub_author"
    t.string   "pub_page"
    t.string   "pub_cited"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "period_id"
    t.integer  "publication_id"
  end

  add_index "sub_publications", ["publication_id"], name: "index_sub_publications_on_publication_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cit_publications", "publications"
  add_foreign_key "main_publications", "publications"
  add_foreign_key "publications", "source_people"
  add_foreign_key "sub_publications", "publications"
end
