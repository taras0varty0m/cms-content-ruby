# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_531_060_809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'contents', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'fileKey', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['fileKey'], name: 'index_contents_on_fileKey', unique: true
    t.index ['user_id'], name: 'index_contents_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'title', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['title'], name: 'index_events_on_title', unique: true
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'playlist_content', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'content_id', null: false
    t.bigint 'playlist_id', null: false
    t.decimal 'duration', null: false
    t.decimal 'priority', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['content_id'], name: 'index_playlist_content_on_content_id'
    t.index ['duration'], name: 'index_playlist_content_on_duration', unique: true
    t.index ['playlist_id'], name: 'index_playlist_content_on_playlist_id'
    t.index ['priority'], name: 'index_playlist_content_on_priority', unique: true
    t.index ['user_id'], name: 'index_playlist_content_on_user_id'
  end

  create_table 'playlists', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'screen_id', null: false
    t.string 'title', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['screen_id'], name: 'index_playlists_on_screen_id'
    t.index ['title'], name: 'index_playlists_on_title', unique: true
    t.index ['user_id'], name: 'index_playlists_on_user_id'
  end

  create_table 'screens', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name', null: false
    t.bigint 'event_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['event_id'], name: 'index_screens_on_event_id'
    t.index ['name'], name: 'index_screens_on_name', unique: true
    t.index ['user_id'], name: 'index_screens_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.boolean 'allow_password_change', default: false
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'name'
    t.string 'nickname'
    t.string 'image'
    t.string 'email'
    t.text 'tokens'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'contents', 'users'
  add_foreign_key 'events', 'users'
  add_foreign_key 'playlist_content', 'contents'
  add_foreign_key 'playlist_content', 'playlists'
  add_foreign_key 'playlist_content', 'users'
  add_foreign_key 'playlists', 'screens'
  add_foreign_key 'playlists', 'users'
  add_foreign_key 'screens', 'events'
  add_foreign_key 'screens', 'users'
end
