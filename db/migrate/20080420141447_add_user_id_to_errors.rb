class AddUserIdToErrors < ActiveRecord::Migration
  def self.up
    add_column :errors, :user_id, :integer
  end

  def self.down
    remove_column :errors, :user_id
  end
end
