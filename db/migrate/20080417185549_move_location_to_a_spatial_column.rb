class MoveLocationToASpatialColumn < ActiveRecord::Migration
  def self.up
    remove_column :errors, :lon
    remove_column :errors, :lat
    add_column :errors, :location, :point, :null=>false
  end

  def self.down
    remove_column :errors, :location
    add_column :errors, :lon, :decimal, :precision => 9, :scale => 6
    add_column :errors, :lat, :decimal, :precision => 9, :scale => 6
  end
end
