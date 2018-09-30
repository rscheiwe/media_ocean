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

ActiveRecord::Schema.define(version: 2018_07_12_204900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.text "title"
    t.datetime "release_date"
    t.text "genres"
    t.text "poster_path"
    t.text "overview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "apinum"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followed_id"], name: "idx_24679_index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "idx_24679_index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "idx_24679_index_relationships_on_follower_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "rating"
  end

  create_table "user_movies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.boolean "seen", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :bigint, default: nil, force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "password_digest"
    t.text "profile_pic"
    t.text "bio"
  end

end
