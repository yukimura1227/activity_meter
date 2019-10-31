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

ActiveRecord::Schema.define(version: 2019_10_31_142341) do

  create_table "activists", force: :cascade do |t|
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "daily_activity_counters", force: :cascade do |t|
    t.string "type"
    t.integer "activist_id"
    t.date "date"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_month"
    t.integer "year"
    t.index ["activist_id", "date"], name: "index_daily_activity_counters_on_activist_id_and_date"
    t.index ["activist_id", "year"], name: "index_daily_activity_counters_on_activist_id_and_year"
    t.index ["activist_id", "year_month"], name: "index_daily_activity_counters_on_activist_id_and_year_month"
  end

end
