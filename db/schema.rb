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

ActiveRecord::Schema.define(version: 20161124004850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_requests", force: :cascade do |t|
    t.datetime "booking_date"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "kitchen_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["kitchen_id"], name: "index_booking_requests_on_kitchen_id", using: :btree
    t.index ["user_id"], name: "index_booking_requests_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "booking_date"
    t.text     "note"
    t.string   "status"
    t.decimal  "fee"
    t.integer  "user_id"
    t.integer  "kitchen_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["kitchen_id"], name: "index_bookings_on_kitchen_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "kitchen_photos", force: :cascade do |t|
    t.text     "image_url"
    t.integer  "kitchen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kitchen_id"], name: "index_kitchen_photos_on_kitchen_id", using: :btree
  end

  create_table "kitchen_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "kitchen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "booking_id"
    t.index ["booking_id"], name: "index_kitchen_reviews_on_booking_id", using: :btree
    t.index ["kitchen_id"], name: "index_kitchen_reviews_on_kitchen_id", using: :btree
    t.index ["user_id"], name: "index_kitchen_reviews_on_user_id", using: :btree
  end

  create_table "kitchens", force: :cascade do |t|
    t.text     "address"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.text     "description"
    t.integer  "capacity"
    t.decimal  "fee"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.index ["user_id"], name: "index_kitchens_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "user_reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "score"
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "booking_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["booking_id"], name: "index_user_reviews_on_booking_id", using: :btree
    t.index ["reviewee_id"], name: "index_user_reviews_on_reviewee_id", using: :btree
    t.index ["reviewer_id"], name: "index_user_reviews_on_reviewer_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "password_digest"
    t.text     "photo_url"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "booking_requests", "kitchens"
  add_foreign_key "booking_requests", "users"
  add_foreign_key "bookings", "kitchens"
  add_foreign_key "bookings", "users"
  add_foreign_key "kitchen_photos", "kitchens"
  add_foreign_key "kitchen_reviews", "bookings"
  add_foreign_key "kitchen_reviews", "kitchens"
  add_foreign_key "kitchen_reviews", "users"
  add_foreign_key "kitchens", "users"
  add_foreign_key "user_reviews", "bookings"
end
