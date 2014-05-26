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

ActiveRecord::Schema.define(version: 20140524215140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "goal"
    t.datetime "deadline"
    t.float    "minimum"
    t.string   "category"
    t.string   "locality"
    t.integer  "organization_id"
    t.text     "short_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "contribution",      default: 0.0
    t.string   "main_image"
    t.string   "video"
    t.string   "history"
  end

  add_index "campaigns", ["organization_id"], name: "index_campaigns_on_organization_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["campaign_id"], name: "index_comments_on_campaign_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contributions", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "perk_id"
    t.integer  "user_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["campaign_id"], name: "index_contributions_on_campaign_id", using: :btree
  add_index "contributions", ["perk_id"], name: "index_contributions_on_perk_id", using: :btree
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id", using: :btree

  create_table "identities", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "done_date"
    t.float    "goal_percentage"
    t.integer  "campaign_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["campaign_id"], name: "index_milestones_on_campaign_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "locality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations_users", id: false, force: true do |t|
    t.integer "user_id",         null: false
    t.integer "organization_id", null: false
  end

  add_index "organizations_users", ["organization_id", "user_id"], name: "index_organizations_users_on_organization_id_and_user_id", using: :btree
  add_index "organizations_users", ["user_id", "organization_id"], name: "index_organizations_users_on_user_id_and_organization_id", using: :btree

  create_table "perks", force: true do |t|
    t.integer  "campaign_id"
    t.float    "amount"
    t.string   "name"
    t.integer  "maximum"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perks", ["campaign_id"], name: "index_perks_on_campaign_id", using: :btree

  create_table "updates", force: true do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["campaign_id"], name: "index_updates_on_campaign_id", using: :btree
  add_index "updates", ["user_id"], name: "index_updates_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
