# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080408201135) do

  create_table "errors", :force => true do |t|
    t.string   "resolution"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lon",        :precision => 9, :scale => 6
    t.decimal  "lat",        :precision => 9, :scale => 6
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
