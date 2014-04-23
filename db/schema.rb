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

ActiveRecord::Schema.define(version: 20140423195337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer  "campaign_perk_id"
    t.integer  "user_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributions", ["campaign_id"], name: "index_contributions_on_campaign_id", using: :btree
  add_index "contributions", ["campaign_perk_id"], name: "index_contributions_on_campaign_perk_id", using: :btree
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id", using: :btree

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

  create_table "perks", force: true do |t|
    t.integer  "campaign_id"
    t.float    "amount"
    t.string   "name"
    t.integer  "maximun"
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

end
