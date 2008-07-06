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

ActiveRecord::Schema.define(:version => 2147483647) do

  create_table "errors", :force => true do |t|
    t.column "resolution", :string
    t.column "feature_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "location", :point, :null => false
    t.column "comment", :text
    t.column "email", :string
    t.column "author_ip", :string
    t.column "user_id", :integer
  end

  create_table "features", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "users", :force => true do |t|
    t.column "login", :string, :limit => 40
    t.column "name", :string, :limit => 100, :default => ""
    t.column "email", :string, :limit => 100
    t.column "crypted_password", :string, :limit => 40
    t.column "salt", :string, :limit => 40
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "remember_token", :string, :limit => 40
    t.column "remember_token_expires_at", :datetime
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
