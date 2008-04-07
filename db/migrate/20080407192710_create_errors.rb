class CreateErrors < ActiveRecord::Migration
  def self.up
    create_table :errors do |t|
      t.string :resolution
      t.integer :feature_id

      t.timestamps
    end
  end

  def self.down
    drop_table :errors
  end
end
