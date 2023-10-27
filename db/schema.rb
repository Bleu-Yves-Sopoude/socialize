# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_10_27_013400) do
=======
ActiveRecord::Schema[7.0].define(version: 20_231_012_160_217) do
>>>>>>> dev
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

<<<<<<< HEAD
  create_table "animals", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.date "date_of_birth"
    t.integer "escape_attempts"
    t.boolean "neutered"
    t.decimal "weight_kg", precision: 5, scale: 2
    t.integer "species_id"
    t.integer "owner_id"
=======
  create_table 'airport', primary_key: 'airport_code', id: { type: :string, limit: 3 }, force: :cascade do |t|
    t.string 'airport_name', limit: 10
  end

  create_table 'animals', id: :integer, default: nil, force: :cascade do |t|
    t.string 'name', limit: 100
    t.date 'date_of_birth'
    t.integer 'escape_attempts'
    t.boolean 'neutered'
    t.decimal 'weight_kg', precision: 5, scale: 2
    t.integer 'species_id'
    t.integer 'owner_id'
>>>>>>> dev
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

<<<<<<< HEAD
  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
=======
  create_table 'company', id: :integer, default: nil, force: :cascade do |t|
    t.text 'name', null: false
    t.integer 'age', null: false
    t.string 'address', limit: 50
    t.float 'salary'
  end

  create_table 'department', id: :integer, default: nil, force: :cascade do |t|
    t.string 'dept', limit: 50, null: false
    t.integer 'emp_id', null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
>>>>>>> dev
  end

  create_table 'owners', id: :integer, default: nil, force: :cascade do |t|
    t.string 'full_name', limit: 255
    t.integer 'age'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'author_id'
    t.integer 'likes_count', default: 0
    t.integer 'comments_count', default: 0
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end

  create_table 'species', id: :integer, default: nil, force: :cascade do |t|
    t.string 'name', limit: 255
  end

<<<<<<< HEAD
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "posts_count", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
=======
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'posts_count', default: 0
>>>>>>> dev
  end

  add_foreign_key 'animals', 'owners', name: 'fk_owner'
  add_foreign_key 'animals', 'species', name: 'fk_species'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'posts', 'users', column: 'author_id'
end
