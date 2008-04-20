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

ActiveRecord::Schema.define(:version => 20080418191830) do

  create_table "errors", :force => true do |t|
    t.column "resolution", :string
    t.column "feature_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "location", :point, :null => false
    t.column "comment", :text
    t.column "email", :string
  end

  create_table "features", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

end
