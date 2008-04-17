class AddCoordinatesToErrors < ActiveRecord::Migration
  def self.up
    add_column :errors, :lon, :decimal, :precision => 9, :scale => 6
    add_column :errors, :lat, :decimal, :precision => 9, :scale => 6
  end

  def self.down
    remove_column :errors, :lon
    remove_column :errors, :lat
  end
end
