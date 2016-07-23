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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131019062347) do

  create_table "admins", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "slug"
    t.integer  "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "performance_tests", :force => true do |t|
    t.decimal  "broad_jump_p1",      :precision => 10, :scale => 2
    t.decimal  "broad_jump_p2",      :precision => 10, :scale => 2
    t.decimal  "broad_jump_p3",      :precision => 10, :scale => 2
    t.decimal  "yard_dash_40_p1",    :precision => 10, :scale => 2
    t.decimal  "yard_dash_40_p2",    :precision => 10, :scale => 2
    t.decimal  "yard_dash_40_p3",    :precision => 10, :scale => 2
    t.decimal  "bench_press_225_p1", :precision => 10, :scale => 2
    t.decimal  "bench_press_225_p2", :precision => 10, :scale => 2
    t.decimal  "bench_press_225_p3", :precision => 10, :scale => 2
    t.decimal  "short_shuttle_p1",   :precision => 10, :scale => 2
    t.decimal  "short_shuttle_p2",   :precision => 10, :scale => 2
    t.decimal  "short_shuttle_p3",   :precision => 10, :scale => 2
    t.decimal  "l_drill_p1",         :precision => 10, :scale => 2
    t.decimal  "l_drill_p2",         :precision => 10, :scale => 2
    t.decimal  "l_drill_p3",         :precision => 10, :scale => 2
    t.decimal  "vertical_jump_p1",   :precision => 10, :scale => 2
    t.decimal  "vertical_jump_p2",   :precision => 10, :scale => 2
    t.decimal  "vertical_jump_p3",   :precision => 10, :scale => 2
    t.decimal  "bench_press_p1",     :precision => 10, :scale => 2
    t.decimal  "bench_press_p2",     :precision => 10, :scale => 2
    t.decimal  "bench_press_p3",     :precision => 10, :scale => 2
    t.decimal  "back_squat_p1",      :precision => 10, :scale => 2
    t.decimal  "back_squat_p2",      :precision => 10, :scale => 2
    t.decimal  "back_squat_p3",      :precision => 10, :scale => 2
    t.decimal  "dead_lift_p1",       :precision => 10, :scale => 2
    t.decimal  "dead_lift_p2",       :precision => 10, :scale => 2
    t.decimal  "dead_lift_p3",       :precision => 10, :scale => 2
    t.decimal  "hang_clean_p1",      :precision => 10, :scale => 2
    t.decimal  "hang_clean_p2",      :precision => 10, :scale => 2
    t.decimal  "hang_clean_p3",      :precision => 10, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.date     "dob"
    t.string   "country"
    t.integer  "height_ft"
    t.integer  "height_in"
    t.integer  "weight"
    t.integer  "football_exp_level"
    t.integer  "weight_training_exp"
    t.decimal  "broad_jump_last",      :precision => 10, :scale => 2
    t.decimal  "broad_jump_pr",        :precision => 10, :scale => 2
    t.decimal  "yard_dash_40_last",    :precision => 10, :scale => 2
    t.decimal  "yard_dash_40_pr",      :precision => 10, :scale => 2
    t.decimal  "bench_press_225_last", :precision => 10, :scale => 2
    t.decimal  "bench_press_225_pr",   :precision => 10, :scale => 2
    t.decimal  "short_shuttle_last",   :precision => 10, :scale => 2
    t.decimal  "short_shuttle_pr",     :precision => 10, :scale => 2
    t.decimal  "l_drill_last",         :precision => 10, :scale => 2
    t.decimal  "l_drill_pr",           :precision => 10, :scale => 2
    t.decimal  "vertical_jump_last",   :precision => 10, :scale => 2
    t.decimal  "vertical_jump_pr",     :precision => 10, :scale => 2
    t.decimal  "bench_press_last",     :precision => 10, :scale => 2
    t.decimal  "bench_press_pr",       :precision => 10, :scale => 2
    t.decimal  "back_squat_last",      :precision => 10, :scale => 2
    t.decimal  "back_squat_pr",        :precision => 10, :scale => 2
    t.decimal  "dead_lift_last",       :precision => 10, :scale => 2
    t.decimal  "dead_lift_pr",         :precision => 10, :scale => 2
    t.decimal  "hang_clean_last",      :precision => 10, :scale => 2
    t.decimal  "hang_clean_pr",        :precision => 10, :scale => 2
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.decimal  "weight_kg",            :precision => 10, :scale => 2
    t.decimal  "height_m",             :precision => 10, :scale => 2
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "full_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "stripe_id"
    t.integer  "plan",                   :default => 0
    t.string   "provider"
    t.string   "uid"
    t.boolean  "buy_now"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
