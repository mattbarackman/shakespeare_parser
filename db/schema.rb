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

ActiveRecord::Schema.define(:version => 20130719220814) do

  create_table "acts", :force => true do |t|
    t.integer  "play_id",    :null => false
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lines", :force => true do |t|
    t.integer "speech_id", :null => false
    t.text    "content",   :null => false
  end

  create_table "plays", :force => true do |t|
    t.text     "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.text     "name",              :null => false
    t.integer  "play_id"
    t.integer  "number_of_lines"
    t.integer  "longest_speech_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "roles_scenes", :force => true do |t|
    t.integer "role_id",  :null => false
    t.integer "scene_id", :null => false
  end

  create_table "roles_speeches", :force => true do |t|
    t.integer "role_id"
    t.integer "speech_id"
  end

  create_table "scenes", :force => true do |t|
    t.integer  "act_id",     :null => false
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "speeches", :force => true do |t|
    t.integer "scene_id", :null => false
  end

end
